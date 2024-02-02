import 'package:bloc/bloc.dart';
import 'package:cats_ca/core/resources/data_state.dart';
import 'package:cats_ca/features/cats/domain/usecases/get_cats_remote_usecase.dart';
import 'package:cats_ca/features/cats/presentation/bloc/cat/remote/remote_cat_event.dart';
import 'package:cats_ca/features/cats/presentation/bloc/cat/remote/remote_cat_state.dart';

class RemoteCatsBloc extends Bloc<RemoteCatsEvent, RemoteCatState> {
  final GetCatsRemoteUsecase _getCatsRemoteUsecase;
  RemoteCatsBloc(this._getCatsRemoteUsecase)
      : super(const RemoteCatsLoading()) {
    on<GetCats>(onGetCats);
  }

  void onGetCats(GetCats event, Emitter<RemoteCatState> emitter) async {
    final dataState = await _getCatsRemoteUsecase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      print(dataState.data);
      emitter(RemoteCatsDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emitter(RemoteCatsError(dataState.error!));
    }
  }
}
