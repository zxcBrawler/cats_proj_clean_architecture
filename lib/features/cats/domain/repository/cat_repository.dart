import 'package:cats_ca/core/resources/data_state.dart';
import 'package:cats_ca/features/cats/domain/entities/cat_entity.dart';

abstract class CatRepository {
  // Api Calls
  Future<DataState<List<CatEntity>>> getCatsRemote(
      {int
          playfulness}); // cannot get all cats from this API, so i choose random parameter to show some cats at the main screen

  Future<DataState<List<CatEntity>>> getCatsShedding({int shedding});
  // Floor DB Calls
  Future<List<CatEntity>> getCatsLocal();
  Future<void> saveCat(CatEntity catEntity);
  Future<void> deleteCat(CatEntity catEntity);
}
