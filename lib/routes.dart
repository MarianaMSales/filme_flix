import 'package:filme_flix_app/models/movie_detail.dart';
import 'package:filme_flix_app/pages/favorites_page.dart';
import 'package:filme_flix_app/pages/home_page.dart';
import 'package:filme_flix_app/pages/initial_page.dart';
import 'package:filme_flix_app/pages/landing_page.dart';
import 'package:filme_flix_app/pages/login_page.dart';
import 'package:filme_flix_app/pages/movie_detail_page.dart';
import 'package:filme_flix_app/pages/search_page.dart';
import 'package:filme_flix_app/pages/settings_page.dart';
import 'package:filme_flix_app/pages/sign_up_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final router = GoRouter(
  initialLocation: '/landing',
  routes: [
    GoRoute(
      path: '/landing',
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      path: '/detail',
      builder: (context, state) {
        final movie = state.extra as MovieDetail;
        return MovieDetailPage(movie: movie);
      },
    ),
    ShellRoute(
      builder: (context, state, child) {
        int? index;
        if (state.extra is int) {
          index = state.extra as int;
        }
        return HomePage(
          index: index ?? 0,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const InitialPage(),
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchPage(),
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => const FavoritesPage(),
        ),
        GoRoute(
          path: '/config',
          builder: (context, state) => const SettingsPage(),
        ),
      ]
    )
  ]
);
