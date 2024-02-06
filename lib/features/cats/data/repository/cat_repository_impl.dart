import 'dart:io';
import 'package:cats_ca/core/resources/data_state.dart';
import 'package:cats_ca/features/cats/data/data_sources/local/cats_database.dart';
import 'package:cats_ca/features/cats/data/data_sources/remote/cats_api_service.dart';
import 'package:cats_ca/features/cats/data/models/cat_model.dart';
import 'package:cats_ca/features/cats/domain/entities/cat_entity.dart';
import 'package:cats_ca/features/cats/domain/repository/cat_repository.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/constants.dart';

class CatRepositoryImpl implements CatRepository {
  final CatsApiService _catsApiService;
  final CatsDatabase _catsDatabase;

  CatRepositoryImpl(this._catsApiService, this._catsDatabase);

  //API

  @override
  Future<DataState<List<CatEntity>>> getCatsRemote(
      {int playfulness = 4}) async {
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
  Future<DataState<List<CatEntity>>> getCatsShedding({int? shedding}) async {
    try {
      final httpResponse = await _catsApiService.getCatsShedding(
          apiKey: apiKey, shedding: shedding);
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

  
  //Floor DB
  @override
  Future<void> saveCat(CatEntity catEntity) {
    return _catsDatabase.catDao.addCat(CatModel.fromEntity(catEntity));
  }

  @override
  Future<void> deleteCat(CatEntity catEntity) {
    return _catsDatabase.catDao.deleteCat(CatModel.fromEntity(catEntity));
  }

  @override
  Future<List<CatModel>> getCatsLocal() {
    return _catsDatabase.catDao.getCats();
  }
}
