import 'package:cats_ca/features/cats/domain/entities/cat_entity.dart';
import 'package:cats_ca/features/cats/presentation/ui/catinfo/cat_info.dart';
import 'package:cats_ca/features/cats/presentation/ui/home/pages/cat_category.dart';
import 'package:flutter/cupertino.dart';
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
    builder: (context, state) {
      Set<CatEntity> cat = state.extra as Set<CatEntity>;
      return CatInfo(cat: cat.first);
    },
  ),
  GoRoute(
    parentNavigatorKey: _rootNavigatorKey,
    path: '/catCategory',
    pageBuilder: (context, state) {
      int value = state.extra as int;

      return CupertinoPage(
          child: CatCategory(
        value: value,
      ));
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
