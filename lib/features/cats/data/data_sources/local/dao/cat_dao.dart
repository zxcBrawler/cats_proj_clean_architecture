import 'package:cats_ca/features/cats/data/models/cat_model.dart';
import 'package:floor/floor.dart';

@dao
abstract class CatDao {
  @Insert()
  Future<void> addCat(CatModel cat);

  @delete
  Future<void> deleteCat(CatModel cat);

  @Query('SELECT * FROM cat')
  Future<List<CatModel>> getCats();
}
