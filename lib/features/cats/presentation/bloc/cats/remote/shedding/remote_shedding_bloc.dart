import 'package:bloc/bloc.dart';
import 'package:cats_ca/core/resources/data_state.dart';
import 'package:cats_ca/features/cats/domain/usecases/get_cats_by_shedding.dart';
import 'package:cats_ca/features/cats/presentation/bloc/cats/remote/allcats/remote_cat_event.dart';
import 'package:cats_ca/features/cats/presentation/bloc/cats/remote/allcats/remote_cat_state.dart';

class RemoteSheddingBloc extends Bloc<RemoteCatsEvent, RemoteCatState> {
  final GetCatsSheddingUsecase _getCatsSheddingUsecase;
  RemoteSheddingBloc(this._getCatsSheddingUsecase,
      )
      : super(const RemoteCatsLoading()) {
    on<GetCatsShedding>(onGetCatsShedding);  }
  
  void onGetCatsShedding(
      GetCatsShedding event, Emitter<RemoteCatState> emitter) async {
    final dataState = await _getCatsSheddingUsecase(params: event.param);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emitter(RemoteCatsDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      print(dataState.error);

      emitter(RemoteCatsError(dataState.error!));
    }
  }


}
