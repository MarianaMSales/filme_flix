import 'package:flutter/material.dart';
import 'package:filme_flix_app/models/movie.dart';
import 'package:filme_flix_app/components/movie_card.dart';
import 'package:filme_flix_app/components/loading_movie_list.dart';
import 'package:filme_flix_app/components/movie_list_error.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final Future<List<Movie>> Function() fetchMovies;

  const MovieSection({
    required this.title,
    required this.fetchMovies,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          FutureBuilder<List<Movie>>(
            future: fetchMovies(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingMovieList();
              } else if (snapshot.hasError) {
                return MovieListError(onRetry: () {});
              }

              final movies = snapshot.data ?? [];

              return SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return MovieCard(movie: movies[index]);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}