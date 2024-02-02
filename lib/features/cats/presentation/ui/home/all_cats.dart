import 'package:cats_ca/features/cats/presentation/bloc/cat/remote/remote_cat_bloc.dart';
import 'package:cats_ca/features/cats/presentation/bloc/cat/remote/remote_cat_state.dart';
import 'package:cats_ca/features/cats/presentation/widget/cat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCats extends StatelessWidget {
  const AllCats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildCatsList(),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: const Text('Cats app'),
    );
  }

  _buildCatsList() {
    return CustomScrollView(
      slivers: [
        BlocBuilder<RemoteCatsBloc, RemoteCatState>(builder: (_, state) {
          if (state is RemoteCatsLoading) {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is RemoteCatsError) {
            return const Center(
              child: Icon(Icons.refresh),
            );
          }
          if (state is RemoteCatsDone) {
            return SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {},
                      child: CatCard(
                        cat: state.cats![index],
                      ));
                },
                childCount: state.cats!.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.9,
              ),
            );
          }
          return const SizedBox();
        }),
      ],
    );
  }
}
