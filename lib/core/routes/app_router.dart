import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routes/route_names.dart';
import 'package:news_app/features/home/screens/home.dart';
import 'package:news_app/features/search/screens/search_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.home,
    routes: [
      GoRoute(
        path: RouteNames.home,
        name: RouteNames.home,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const Home(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 400),
        ),
      ),

      GoRoute(
        path: RouteNames.search,
        name: RouteNames.search,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SearchScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 400),
        ),
      ),
    ],
  );
}
