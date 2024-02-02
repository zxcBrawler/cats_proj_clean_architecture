import 'dart:io';

import 'package:cats_ca/core/resources/data_state.dart';
import 'package:cats_ca/features/cats/data/data_sources/remote/cats_api_service.dart';
import 'package:cats_ca/features/cats/domain/entities/cat_entity.dart';
import 'package:cats_ca/features/cats/domain/repository/cat_repository.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/constants.dart';

class CatRepositoryImpl implements CatRepository {
  final CatsApiService _catsApiService;

  CatRepositoryImpl(this._catsApiService);



  //API

  @override
  Future<DataState<List<CatEntity>>> getCatsRemote({int playfulness = 5}) async {
    try {
      final httpResponse = await _catsApiService.getCats(
          apiKey: apiKey, playfulness: playfulness);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<CatEntity>> getOneCat(String name) async {
    try {
      final httpResponse =
          await _catsApiService.getCatByName(apiKey: apiKey, name: name);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.single);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  //Hive DB
  @override
  Future<void> saveCat(CatEntity catEntity) {
    // TODO: implement saveCat
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCat(CatEntity catEntity) {
    // TODO: implement deleteCat
    throw UnimplementedError();
  }

  @override
  Future<List<CatEntity>> getCatsLocal() {
    // TODO: implement getCatsLocal
    throw UnimplementedError();
  }
}
