class Movie {
  int id;
  String name;
  String images;
  String imdb;
  String poster;
  String overview;
  String genres;
  Movie(
      {this.id = 1,
      this.name = "",
      this.images = "",
      this.imdb = "",
      this.poster = "",
      this.overview = "",
      this.genres = ""});
  factory Movie.fromJson(Map<String, dynamic> json) {
    List<dynamic> genresList = json['genres'] ?? [];
    String firstGenre =
        genresList.isNotEmpty ? genresList[0]['name'].toString() : "";

    return Movie(
      id: json['id'] ?? 0,
      name: json['original_title'] ?? "",
      images: json['backdrop_path'] ?? "",
      imdb: json['vote_average'].toStringAsFixed(1),
      poster: json['poster_path'] ?? "",
      overview: json["overview"] ?? "",
      genres: firstGenre,
    );
  }
}
