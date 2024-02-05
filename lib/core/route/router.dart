import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/cats/presentation/ui/home/home.dart';
import '../../features/cats/presentation/ui/home/pages/all_cats.dart';
import '../../features/cats/presentation/ui/home/pages/cats_categories.dart';
import '../../features/cats/presentation/ui/home/pages/favourite_cats.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();
final router =
    GoRouter(initialLocation: '/', navigatorKey: _rootNavigatorKey, routes: [
GoRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: '/catDetails',
    pageBuilder: (context, state) {
      return NoTransitionPage(
        key: UniqueKey(),
        child: Scaffold(
          appBar: AppBar(),
          body: const Center(
            child: Text(""),
          ),
        ),
      );
    },
  ),
  ShellRoute(
    navigatorKey: _shellNavigatorKey,
    pageBuilder: (context, state, child) {
      return NoTransitionPage(
          child: Home(
        location: state.matchedLocation,
        child: child,
      ));
    },
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        parentNavigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: AllCats());
        },
      ),
      GoRoute(
        path: '/favourite',
        parentNavigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: FavouriteCats());
        },
      ),
      GoRoute(
        path: '/categories',
        parentNavigatorKey: _shellNavigatorKey,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: CatsCategories());
        },
      ),
    ],
  ),
  
]);
