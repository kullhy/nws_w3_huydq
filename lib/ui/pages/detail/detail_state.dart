part of 'detail_cubit.dart';

class DetailState extends Equatable {
  final LoadStatus loadDataStatus;
  final Movie movie;
  final List<Actor> actors;
  final bool showMore;

  const DetailState({
    this.loadDataStatus = LoadStatus.initial,
    required this.movie,
    required this.actors,
    required this.showMore,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
      ];

  DetailState copyWith({
    LoadStatus? loadDataStatus,
    List<Actor>? actors,
    Movie? movie,
    final bool? showMore,
  }) {
    return DetailState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
      movie: movie ?? this.movie,
      actors: actors ?? this.actors,
      showMore: showMore??this.showMore,
    );
  }
}
