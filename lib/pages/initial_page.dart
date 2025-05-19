import 'package:filme_flix_app/components/movie_section.dart';
import 'package:filme_flix_app/models/movie.dart';
import 'package:filme_flix_app/repositories/movie_repository.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  late MovieRepository movieRepository;

  @override
  void initState() {
    super.initState();
    movieRepository = MovieRepository();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/madame_web.jpg',
          fit: BoxFit.cover,
          height: 450,
          width: double.infinity,
        ),
        const SizedBox(height: 20),
        MovieSection(
            title: 'Popular Movies',
            fetchMovies: () => _loadMovies(
              'movie/popular',
              'popularMovies',
            ),
          ),
          MovieSection(
            title: 'New and Noteworthy',
            fetchMovies: () => _loadMovies(
              'movie/now_playing',
              'nowPlayingMovies',
            ),
          ),
          MovieSection(
            title: 'Upcoming Movies',
            fetchMovies: () => _loadMovies(
              'movie/upcoming',
              'upcomingMovies',
            ),
          ),
          MovieSection(
            title: 'Top Rated Movies',
            fetchMovies: () => _loadMovies(
              'movie/top_rated',
              'topRatedMovies',
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Movie>> _loadMovies(
    String path,
    String cacheKey,
  ) async {
    final moviesDb = await movieRepository.getMoviesDb(cacheKey);
    if (moviesDb.isNotEmpty) {
      return moviesDb;
    }

    return await movieRepository.getMovies(path, cacheKey);
  }
}
