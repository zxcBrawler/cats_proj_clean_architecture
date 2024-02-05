import 'package:cats_ca/features/cats/data/data_sources/remote/cats_api_service.dart';
import 'package:cats_ca/features/cats/data/repository/cat_repository_impl.dart';
import 'package:cats_ca/features/cats/domain/repository/cat_repository.dart';
import 'package:cats_ca/features/cats/domain/usecases/get_cats_by_shedding.dart';
import 'package:cats_ca/features/cats/domain/usecases/get_cats_remote_usecase.dart';
import 'package:cats_ca/features/cats/presentation/bloc/cats/remote/allcats/remote_cat_bloc.dart';
import 'package:cats_ca/features/cats/presentation/bloc/cats/remote/shedding/remote_shedding_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final service = GetIt.instance;
Future<void> init() async {
  //Dio
  service.registerSingleton<Dio>(Dio());

  //Dependencies
  service.registerSingleton<int>(0);
  service.registerSingleton<CatsApiService>(CatsApiService(service()));

  service.registerSingleton<CatRepository>(CatRepositoryImpl(
      service())); // inject another service() after hive injection
  //Use case
  service
      .registerSingleton<GetCatsRemoteUsecase>(GetCatsRemoteUsecase(service()));


  service.registerSingleton<GetCatsSheddingUsecase>(
      GetCatsSheddingUsecase(service()));

  //Blocs
  service.registerFactory<RemoteCatsBloc>(() => RemoteCatsBloc(service()));
  service
      .registerFactory<RemoteSheddingBloc>(() => RemoteSheddingBloc(service()));

  //external -> hive sp
}
