import 'package:cats_ca/features/cats/presentation/ui/catinfo/cat_info.dart';
import 'package:cats_ca/features/cats/presentation/widget/placeholder_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/cats/remote/remote_cat_bloc.dart';
import '../../../bloc/cats/remote/remote_cat_state.dart';
import '../../../widget/cat_card.dart';

class AllCats extends StatefulWidget {
  const AllCats({super.key});

  @override
  State<AllCats> createState() => _AllCatsState();
}

class _AllCatsState extends State<AllCats> {
  bool crossfade = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCatsList(),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CatInfo(cat: state.cats![index]),
                            ));
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
