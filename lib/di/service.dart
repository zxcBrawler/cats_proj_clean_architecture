import 'package:cats_ca/features/cats/data/data_sources/remote/cats_api_service.dart';
import 'package:cats_ca/features/cats/data/repository/cat_repository_impl.dart';
import 'package:cats_ca/features/cats/domain/repository/cat_repository.dart';
import 'package:cats_ca/features/cats/domain/usecases/get_cat_by_name_usecase.dart';
import 'package:cats_ca/features/cats/domain/usecases/get_cats_remote_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final service = GetIt.instance;
Future<void> init() async {
  //Dio
  service.registerSingleton<Dio>(Dio());

  //Dependencies
  service.registerSingleton<CatsApiService>(CatsApiService(service()));

  service.registerSingleton<CatRepository>(CatRepositoryImpl(
      service())); // inject another service() after hive injection

  //Use case
  service
      .registerSingleton<GetCatsRemoteUsecase>(GetCatsRemoteUsecase(service()));
  service
      .registerSingleton<GetCatByNameUseCase>(GetCatByNameUseCase(service()));

  //Repo -> repository repositoryimpl datasource (local, remote)

  //Blocs

  //external -> hive sp
}