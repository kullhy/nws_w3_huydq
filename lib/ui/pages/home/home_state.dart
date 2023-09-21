part of 'home_cubit.dart';

class HomeState extends Equatable {
  final LoadStatus loadDataStatus;
  final List<Movie> popularMovies;
  final List<Movie> upComingMovies;

  const HomeState({
    this.loadDataStatus = LoadStatus.initial,
    this.popularMovies = const [],
    this.upComingMovies = const [],
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
      ];

  HomeState copyWith({
    LoadStatus? loadDataStatus,
    List<Movie>? popularMovies,
    List<Movie>? upComingMovies,
  }) {
    return HomeState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
      popularMovies: popularMovies ?? this.popularMovies,
      upComingMovies: upComingMovies ?? this.upComingMovies,
    );
  }
}
