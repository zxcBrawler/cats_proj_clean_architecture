import 'package:cats_ca/core/resources/data_state.dart';
import 'package:cats_ca/features/cats/domain/entities/cat_entity.dart';

abstract class CatRepository {
  // Api Calls
  Future<DataState<List<CatEntity>>> getCatsRemote({int playfulness});
  Future<DataState<CatEntity>> getOneCat(String name);

  // Hive DB Calls
  Future<List<CatEntity>> getCatsLocal();
  Future<void> saveCat(CatEntity catEntity);
  Future<void> deleteCat(CatEntity catEntity);
}
