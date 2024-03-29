import 'package:cats_ca/core/theme/theme.dart';
import 'package:cats_ca/features/cats/domain/repository/cat_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/route/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CatRepository,
        child: MaterialApp.router(
          routerDelegate: router.routerDelegate,
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
          theme: myTheme,
          debugShowCheckedModeBanner: false,
        ),
    );
  }
}
