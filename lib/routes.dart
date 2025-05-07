import 'package:filme_flix_app/pages/home_page.dart';
import 'package:filme_flix_app/pages/initial_page.dart';
import 'package:filme_flix_app/pages/landing_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final router = GoRouter(
  initialLocation: '/login',
  // redirect: (context, state) {
  //   return '/login';
  // },
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LandingPage(),
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
          builder: (context, state) => Container(color: Colors.pink),
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => Container(color: Colors.yellow),
        ),
        GoRoute(
          path: '/config',
          builder: (context, state) => Container(color: Colors.white),
        ),
      ]
    )
  ]
);
