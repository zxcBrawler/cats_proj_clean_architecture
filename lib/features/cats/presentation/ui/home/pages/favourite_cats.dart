import 'package:cats_ca/core/theme/colors.dart';
import 'package:cats_ca/di/service.dart';
import 'package:cats_ca/features/cats/domain/entities/cat_entity.dart';
import 'package:cats_ca/features/cats/presentation/bloc/cats/local/local_cat_bloc.dart';
import 'package:cats_ca/features/cats/presentation/bloc/cats/local/local_cat_event.dart';
import 'package:cats_ca/features/cats/presentation/bloc/cats/local/local_cat_state.dart';
import 'package:cats_ca/features/cats/presentation/widget/cat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCats extends StatefulWidget {
  const FavouriteCats({super.key});

  @override
  State<FavouriteCats> createState() => _FavouriteCatsState();
}

class _FavouriteCatsState extends State<FavouriteCats> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => service<LocalCatsBloc>()..add(const GetCatsLocal()),
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<LocalCatsBloc, LocalCatState>(
      builder: (context, state) {
        if (state is LocalCatsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LocalCatsDone) {
          return _buildArticlesList(state.cats!);
        }
        return Container();
      },
    );
  }

  Widget _buildArticlesList(List<CatEntity> cats) {
    if (cats.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment:
              CrossAxisAlignment.center, 
          children: [
            Icon(
              Icons.sentiment_dissatisfied,
              size: 40,
            ),
            Text(
              "no favourite cats",
              style: TextStyle(fontSize: 30),
            ),
            // Add more widgets as needed
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: cats.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(cats[index].name!),
          onDismissed: (direction) {
            _onRemoveArticle(context, cats[index]);
          },
          background: Container(
            color: CustomColors.accentColor,
            alignment: Alignment.centerRight,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
          direction: DismissDirection.endToStart,
          child: CatCard(
            cat: cats[index],
          ),
        );
      },
    );
  }

  void _onRemoveArticle(BuildContext context, CatEntity catEntity) {
    BlocProvider.of<LocalCatsBloc>(context).add(DeleteCat(catEntity));
  }
}
