import 'package:cats_ca/core/theme/theme.dart';
import 'package:cats_ca/features/cats/domain/repository/cat_repository.dart';
import 'package:cats_ca/features/cats/presentation/bloc/cat/remote/remote_cat_bloc.dart';
import 'package:cats_ca/features/cats/presentation/bloc/cat/remote/remote_cat_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../di/service.dart';
import 'cats/presentation/ui/home/all_cats.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CatRepository,
      child: BlocProvider<RemoteCatsBloc>(
        create: (context) => service()..add(const GetCats()),
        child: MaterialApp(
          theme: myTheme,
          debugShowCheckedModeBanner: false,
          home: const AllCats(),
        ),
      ),
    );
  }
}
