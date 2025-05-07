import 'package:dio/dio.dart';
import 'package:filme_flix_app/app_config.dart';
import 'package:filme_flix_app/models/movie.dart';

class MovieRepository {
  final Dio client = Dio(
    BaseOptions(
      baseUrl: AppConfig.instance.baseUrl,
      headers: {
        'Authorization': 'Bearer ${AppConfig.instance.token}'
      },
      queryParameters: {
        'language': 'pt-BR'
      }
    ),
  );

   Future<List<Movie>> getMovies(String path) async {
      final response = await client.get(path, queryParameters: {
        'page': 1,
      });

      return (response.data['results'] as List).map((movie) => Movie.fromJson(movie)).toList();
  }
}