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
  @GET('family_friendly={family_friendly}')
  Future<HttpResponse<List<CatModel>>> getCatsFamilyFriendly({
    @Query("X-Api-Key") String? apiKey,
    @Query("family_friendly") int? familyFriendly,
  });

  @GET('shedding={shedding}')
  Future<HttpResponse<List<CatModel>>> getCatsShedding({
    @Query("X-Api-Key") String? apiKey,
    @Query("shedding") int? shedding,
  });
  @GET('intelligence={intelligence}')
  Future<HttpResponse<List<CatModel>>> getCatsIntelligence({
    @Query("X-Api-Key") String? apiKey,
    @Query("intelligence") int? intelligence,
  });

  @GET('general_health={general_health}')
  Future<HttpResponse<List<CatModel>>> getCatsGeneralHealth({
    @Query("X-Api-Key") String? apiKey,
    @Query("general_health") int? generalHealth,
  });
}
