import 'package:filme_flix_app/components/movie_section.dart';
import 'package:filme_flix_app/repositories/movie_repository.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
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
          fetchMovies: () => MovieRepository().getMovies('/movie/popular'),
        ),
        const SizedBox(height: 10),
        MovieSection(
          title: 'New and Noteworthy',
          fetchMovies: () => MovieRepository().getMovies('/movie/now_playing?'),
        ),
        const SizedBox(height: 10),
        MovieSection(
          title: 'Upcoming Movies',
          fetchMovies: () => MovieRepository().getMovies('/movie/upcoming'),
        ),
        const SizedBox(height: 10),
        MovieSection(
          title: 'Top Rated Movies',
          fetchMovies: () => MovieRepository().getMovies('/movie/top_rated'),
        ),
        const SizedBox(height: 10),
      ],
    ),
  );
}
}