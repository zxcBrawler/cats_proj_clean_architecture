import 'package:bloc/bloc.dart';
import 'package:cats_ca/core/resources/data_state.dart';
import 'package:cats_ca/features/cats/domain/usecases/get_cats_by_family_friendly.dart';
import 'package:cats_ca/features/cats/domain/usecases/get_cats_by_general_health.dart';
import 'package:cats_ca/features/cats/domain/usecases/get_cats_by_intelligence.dart';
import 'package:cats_ca/features/cats/domain/usecases/get_cats_by_shedding.dart';
import 'package:cats_ca/features/cats/domain/usecases/get_cats_remote_usecase.dart';
import 'package:cats_ca/features/cats/presentation/bloc/cats/remote/remote_cat_event.dart';
import 'package:cats_ca/features/cats/presentation/bloc/cats/remote/remote_cat_state.dart';

 
class RemoteCatsBloc extends Bloc<RemoteCatsEvent, RemoteCatState> {
  final GetCatsRemoteUsecase _getCatsRemoteUsecase;
  final GetCatsFamilyFriendlyUsecase _getCatsFamilyFriendlyUsecase;
  final GetCatsGeneralHealthUsecase _getCatsGeneralHealthUsecase;
  final GetCatsIntelligenceUsecase _getCatsIntelligenceUsecase;
  final GetCatsSheddingUsecase _getCatsSheddingUsecase;
  RemoteCatsBloc(
      this._getCatsRemoteUsecase,
      this._getCatsFamilyFriendlyUsecase,
      this._getCatsGeneralHealthUsecase,
      this._getCatsIntelligenceUsecase,
      this._getCatsSheddingUsecase)
      : super(const RemoteCatsLoading()) {
    on<GetCats>(onGetCats);
    on<GetCatsFamilyFriendly>(onGetCatsFamilyFriendly);
    on<GetCatsGeneralHealth>(onGetCatsGeneralHealth);
    on<GetCatsIntelligence>(onGetCatsIntelligence);
    on<GetCatsShedding>(onGetCatsShedding);
  }

  void onGetCats(GetCats event, Emitter<RemoteCatState> emitter) async {
    final dataState = await _getCatsRemoteUsecase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emitter(RemoteCatsDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emitter(RemoteCatsError(dataState.error!));
    }
  }

  void onGetCatsFamilyFriendly(
      GetCatsFamilyFriendly event, Emitter<RemoteCatState> emitter) async {
    final dataState = await _getCatsFamilyFriendlyUsecase(params: event.param);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emitter(RemoteCatsDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emitter(RemoteCatsError(dataState.error!));
    }
  }

  void onGetCatsGeneralHealth(
      GetCatsGeneralHealth event, Emitter<RemoteCatState> emitter) async {
    final dataState = await _getCatsGeneralHealthUsecase(params: event.param);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emitter(RemoteCatsDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emitter(RemoteCatsError(dataState.error!));
    }
  }

  void onGetCatsIntelligence(
      GetCatsIntelligence event, Emitter<RemoteCatState> emitter) async {
    final dataState = await _getCatsIntelligenceUsecase(params: event.param);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emitter(RemoteCatsDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emitter(RemoteCatsError(dataState.error!));
    }
  }

  void onGetCatsShedding(
      GetCatsShedding event, Emitter<RemoteCatState> emitter) async {
    final dataState = await _getCatsSheddingUsecase(params: event.param);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emitter(RemoteCatsDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emitter(RemoteCatsError(dataState.error!));
    }
  }
}
