import 'package:cats_ca/features/cats/domain/usecases/local/add_cat.dart';
import 'package:cats_ca/features/cats/domain/usecases/local/delete_cat.dart';
import 'package:cats_ca/features/cats/domain/usecases/local/get_local_cats.dart';
import 'package:cats_ca/features/cats/presentation/bloc/cats/local/local_cat_event.dart';
import 'package:cats_ca/features/cats/presentation/bloc/cats/local/local_cat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalCatsBloc extends Bloc<LocalCatsEvent, LocalCatState> {
  final GetCatsLocalUsecase _catsLocalUsecase;
  final AddCatLocalUsecase _addCatLocalUsecase;
  final DeleteCatLocalUsecase _deleteCatLocalUsecase;
  LocalCatsBloc(this._catsLocalUsecase, this._addCatLocalUsecase,
      this._deleteCatLocalUsecase)
      : super(const LocalCatsLoading()) {
    on<GetCatsLocal>(onGetCats);
    on<DeleteCat>(onDeleteCat);
    on<AddCat>(onAddCat);
  }

  void onGetCats(GetCatsLocal event, Emitter<LocalCatState> emitter) async {
    final cats = await _catsLocalUsecase();
    emitter(LocalCatsDone(cats));
  }

  void onDeleteCat(DeleteCat event, Emitter<LocalCatState> emitter) async {
    await _deleteCatLocalUsecase(params: event.catEntity);
    final cats = await _catsLocalUsecase();
    emitter(LocalCatsDone(cats));
  }

  void onAddCat(AddCat event, Emitter<LocalCatState> emitter) async {
    await _addCatLocalUsecase(params: event.catEntity);
    final cats = await _catsLocalUsecase();
    emitter(LocalCatsDone(cats));
  }
}
