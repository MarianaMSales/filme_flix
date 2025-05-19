class MovieDetail {
  final String title;
  final String overview;
  final String? imagePath;
  final String releaseYear;
  final List<String> genres;
  final List<String> productionCompanies;
  final int runtime;
  final String tagline;

  MovieDetail({
    required this.title,
    required this.overview,
    required this.imagePath,
    required this.releaseYear,
    required this.genres,
    required this.productionCompanies,
    required this.runtime,
    required this.tagline,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      title: json['title'],
      overview: json['overview'],
      imagePath: json['backdrop_path'],
      releaseYear: json['release_date'].substring(0, 4),
      genres: List<String>.from(json['genres'].map((g) => g['name'])),
      productionCompanies: List<String>.from(json['production_companies'].map((c) => c['name'])),
      runtime: json['runtime'],
      tagline: json['tagline'],
    );
  }
}