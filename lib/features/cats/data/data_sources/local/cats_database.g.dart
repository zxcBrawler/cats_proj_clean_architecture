// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cats_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorCatsDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$CatsDatabaseBuilder databaseBuilder(String name) =>
      _$CatsDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$CatsDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$CatsDatabaseBuilder(null);
}

class _$CatsDatabaseBuilder {
  _$CatsDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$CatsDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$CatsDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<CatsDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$CatsDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$CatsDatabase extends CatsDatabase {
  _$CatsDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CatDao? _catDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `cat` (`length` TEXT, `origin` TEXT, `imageLink` TEXT, `familyFriendly` INTEGER, `shedding` INTEGER, `generalHealth` INTEGER, `playfulness` INTEGER, `childrenFriendly` INTEGER, `grooming` INTEGER, `intelligence` INTEGER, `otherPetsFriendly` INTEGER, `minWeight` REAL, `maxWeight` REAL, `minLifeExpectancy` REAL, `maxLifeExpectancy` REAL, `name` TEXT, PRIMARY KEY (`name`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CatDao get catDao {
    return _catDaoInstance ??= _$CatDao(database, changeListener);
  }
}

class _$CatDao extends CatDao {
  _$CatDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _catModelInsertionAdapter = InsertionAdapter(
            database,
            'cat',
            (CatModel item) => <String, Object?>{
                  'length': item.length,
                  'origin': item.origin,
                  'imageLink': item.imageLink,
                  'familyFriendly': item.familyFriendly,
                  'shedding': item.shedding,
                  'generalHealth': item.generalHealth,
                  'playfulness': item.playfulness,
                  'childrenFriendly': item.childrenFriendly,
                  'grooming': item.grooming,
                  'intelligence': item.intelligence,
                  'otherPetsFriendly': item.otherPetsFriendly,
                  'minWeight': item.minWeight,
                  'maxWeight': item.maxWeight,
                  'minLifeExpectancy': item.minLifeExpectancy,
                  'maxLifeExpectancy': item.maxLifeExpectancy,
                  'name': item.name
                }),
        _catModelDeletionAdapter = DeletionAdapter(
            database,
            'cat',
            ['name'],
            (CatModel item) => <String, Object?>{
                  'length': item.length,
                  'origin': item.origin,
                  'imageLink': item.imageLink,
                  'familyFriendly': item.familyFriendly,
                  'shedding': item.shedding,
                  'generalHealth': item.generalHealth,
                  'playfulness': item.playfulness,
                  'childrenFriendly': item.childrenFriendly,
                  'grooming': item.grooming,
                  'intelligence': item.intelligence,
                  'otherPetsFriendly': item.otherPetsFriendly,
                  'minWeight': item.minWeight,
                  'maxWeight': item.maxWeight,
                  'minLifeExpectancy': item.minLifeExpectancy,
                  'maxLifeExpectancy': item.maxLifeExpectancy,
                  'name': item.name
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CatModel> _catModelInsertionAdapter;

  final DeletionAdapter<CatModel> _catModelDeletionAdapter;

  @override
  Future<List<CatModel>> getCats() async {
    return _queryAdapter.queryList('SELECT * FROM cat',
        mapper: (Map<String, Object?> row) => CatModel(
            length: row['length'] as String?,
            origin: row['origin'] as String?,
            imageLink: row['imageLink'] as String?,
            familyFriendly: row['familyFriendly'] as int?,
            shedding: row['shedding'] as int?,
            generalHealth: row['generalHealth'] as int?,
            playfulness: row['playfulness'] as int?,
            childrenFriendly: row['childrenFriendly'] as int?,
            grooming: row['grooming'] as int?,
            intelligence: row['intelligence'] as int?,
            otherPetsFriendly: row['otherPetsFriendly'] as int?,
            minWeight: row['minWeight'] as double?,
            maxWeight: row['maxWeight'] as double?,
            minLifeExpectancy: row['minLifeExpectancy'] as double?,
            maxLifeExpectancy: row['maxLifeExpectancy'] as double?,
            name: row['name'] as String?));
  }

  @override
  Future<void> addCat(CatModel cat) async {
    await _catModelInsertionAdapter.insert(cat, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteCat(CatModel cat) async {
    await _catModelDeletionAdapter.delete(cat);
  }
}
