import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:filme_flix_app/app_config.dart';
import 'package:filme_flix_app/models/movie.dart';
import 'package:filme_flix_app/models/movie_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  SharedPreferences? _preferences;
  FutureOr<SharedPreferences> get db async {
    _preferences ??= await SharedPreferences.getInstance();
    return _preferences!;
  }

  Future<List<Movie>> getMovies(String path, String cacheKey) async {
    final response = await client.get(path, queryParameters: {
      'page': 1,
    });

    final movies = (response.data['results'] as List)
        .map((movie) => Movie.fromJson(movie))
        .toList();

    final storage = await db;
    storage.setStringList(
      cacheKey,
      movies.map((m) => jsonEncode(m.toJson())).toList(),
    );

    final prefs = await SharedPreferences.getInstance();
    final savedList = prefs.getStringList('popularMovies');

    print('Filmes salvos (popularMovies):');
    for (final movieJson in savedList ?? []) {
      print(movieJson);
    }

    return movies;
  }

  Future<List<Movie>> getMoviesDb(String cacheKey) async {
    final storage = await db;
    final movies = storage.getStringList(cacheKey) ?? [];

    return movies.map((m) => Movie.fromJson(jsonDecode(m))).toList();
  }

  Future<MovieDetail> getMovie(int id) async {
      final response = await client.get('movie/$id', queryParameters: {
        'page': 1,
      });

      return MovieDetail.fromJson(response.data);
  }
}
