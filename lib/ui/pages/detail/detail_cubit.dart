import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_w3_huydq/configs/app_configs.dart';
import 'package:nws_w3_huydq/models/actor.dart';
import 'package:nws_w3_huydq/models/enums/load_status.dart';
import 'package:http/http.dart' as http;
import 'package:nws_w3_huydq/models/movies.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit()
      : super(DetailState(movie: Movie(), actors: const [], showMore: false));

  bool showMore = false;

  Future<void> loadInitialData(Movie movie) async {
    emit(state.copyWith(loadDataStatus: LoadStatus.loading));
    try {
      final detailMovie = await fetchMovie(movie.id);
      final casts = await fetchCast(movie.id);

      emit(state.copyWith(
          loadDataStatus: LoadStatus.success,
          movie: detailMovie,
          actors: casts,
          showMore: false));
    } catch (e) {
      emit(state.copyWith(loadDataStatus: LoadStatus.failure));
    }
  }

  void showMoreText() {
    emit(state.copyWith(loadDataStatus: LoadStatus.loading));
    showMore = !showMore;
    emit(state.copyWith(
      loadDataStatus: LoadStatus.success,
      showMore: showMore,
    ));
  }

  Future<Movie> fetchMovie(int id) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '${MovieAPIConfig.host}/$id?&api_key=${MovieAPIConfig.apiKey}'));

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var responseBody = await http.Response.fromStream(response);
      final jsonData = jsonDecode(responseBody.body);
      final movies = Movie.fromJson(jsonData);
      return movies;
    } else {
      return Movie();
    }
  }

  Future<List<Actor>> fetchCast(int id) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            '${MovieAPIConfig.host}/$id/credits?&api_key=${MovieAPIConfig.apiKey}'));

    http.StreamedResponse response = await request.send();
    log(jsonEncode(response.statusCode));
    if (response.statusCode == 200) {
      var responseBody = await http.Response.fromStream(response);
      final jsonData = jsonDecode(responseBody.body);
      final actorList = jsonData['cast'] as List<dynamic>;

      final actors =
          actorList.map((movieJson) => Actor.fromJson(movieJson)).toList();
      return actors;
    } else {
      log(response.reasonPhrase.toString());
      return [];
    }
  }
}
