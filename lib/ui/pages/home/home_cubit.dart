import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_w3_huydq/configs/app_configs.dart';
import 'package:nws_w3_huydq/models/enums/load_status.dart';
import 'package:http/http.dart' as http;
import 'package:nws_w3_huydq/models/movies.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  Future<void> loadInitialData() async {
    emit(state.copyWith(loadDataStatus: LoadStatus.loading));
    try {
      final popularMovies = await fetchMovie("popular");
      final upComingMovies = await fetchMovie("upcoming");
      
      emit(state.copyWith(
          loadDataStatus: LoadStatus.success, popularMovies: popularMovies,upComingMovies: upComingMovies));
    } catch (e) {
      emit(state.copyWith(loadDataStatus: LoadStatus.failure));
    }
  }

  Future<List<Movie>> fetchMovie(String type) async {
    var request = http.Request(
        'POST',
        Uri.parse(
            '${MovieAPIConfig.host}/$type?language=en-US&page=1&api_key=${MovieAPIConfig.apiKey}'));
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var responseBody = await http.Response.fromStream(response);
      final jsonData = jsonDecode(responseBody.body) as Map<String, dynamic>;
      final moviesList = jsonData['results'] as List<dynamic>;

      final movies = moviesList
          .take(10)
          .map((movieJson) => Movie.fromJson(movieJson))
          .toList();
      return movies;
    } else {
      log(response.reasonPhrase.toString());
      return [];
    }
  }
}
