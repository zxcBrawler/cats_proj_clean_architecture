import 'package:cats_ca/core/route/router.dart';
import 'package:cats_ca/di/service.dart';
import 'package:cats_ca/features/cats/presentation/bloc/cats/remote/allcats/remote_cat_event.dart';
import 'package:cats_ca/features/cats/presentation/bloc/cats/remote/allcats/remote_cat_state.dart';
import 'package:cats_ca/features/cats/presentation/bloc/cats/remote/shedding/remote_shedding_bloc.dart';
import 'package:cats_ca/features/cats/presentation/widget/cat_card.dart';
import 'package:cats_ca/features/cats/presentation/widget/placeholder_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatCategory extends StatefulWidget {
  final int value;
  const CatCategory({
    super.key,
    required this.value,
  });

  @override
  State<CatCategory> createState() => _CatCategoryState();
}

class _CatCategoryState extends State<CatCategory> {
  bool crossfade = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteSheddingBloc>(
      create: (context) => service()..add(GetCatsShedding(widget.value)),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(child: Expanded(child: _buildCatsList())),
      ),
    );
  }

  _buildCatsList() {
    return CustomScrollView(
      slivers: [
        BlocBuilder<RemoteSheddingBloc, RemoteCatState>(builder: (_, state) {
          if (state is RemoteCatsLoading) {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is RemoteCatsError) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Icon(Icons.refresh),
              ),
            );
          }
          if (state is RemoteCatsDone) {
            Future.delayed(const Duration(seconds: 2), () {
              setState(() {
                crossfade = true;
              });
            });

            return SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        router.push("/catDetails", extra: {state.cats![index]});
                      },
                      child: AnimatedCrossFade(
                        firstChild: CatCard(
                          cat: state.cats![index],
                        ),
                        secondChild: buildPlaceholder(),
                        crossFadeState: crossfade
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(seconds: 2),
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
