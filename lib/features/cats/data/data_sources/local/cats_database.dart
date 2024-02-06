import 'package:cats_ca/features/cats/data/data_sources/local/dao/cat_dao.dart';
import 'package:cats_ca/features/cats/data/models/cat_model.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'cats_database.g.dart';

@Database(version: 1, entities: [CatModel])
abstract class CatsDatabase extends FloorDatabase {
  CatDao get catDao;
}
