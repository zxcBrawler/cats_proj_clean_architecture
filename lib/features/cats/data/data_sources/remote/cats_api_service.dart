import 'package:cats_ca/core/constants/constants.dart';
import 'package:cats_ca/features/cats/data/models/cat_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'cats_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class CatsApiService {
  factory CatsApiService(Dio dio) = _CatsApiService;

  @GET('playfulness={playfulness}')
  Future<HttpResponse<List<CatModel>>> getCats({
    @Query("X-Api-Key") String? apiKey,
    @Query("playfulness") int? playfulness,
  });

  @GET('shedding={shedding}')
  Future<HttpResponse<List<CatModel>>> getCatsShedding({
    @Query("X-Api-Key") String? apiKey,
    @Query("shedding") int? shedding,
  });
   
}
