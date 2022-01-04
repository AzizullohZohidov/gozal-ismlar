import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gozal_ismlar/data/models/name_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NamesDatabase {
  final String dbName = 'beautiful_names.db';
  final String jsonDbPath = 'assets/json/names.json';

  static final NamesDatabase instance = NamesDatabase._init();

  static Database? _database;

  NamesDatabase._init();

  Future<Database> get database async {
    //await deleteDb(dbName);
    if (_database != null) {
      //print('Now displaying data from database');
      //await displayDatabaseData();
      //print('Displaying data from database is finished');
      return _database!;
    }
    print('db is null');
    _database = await _initDB(dbName);
    print('Database initialization is finished');
    //print('Now displaying data from database');
    //await displayDatabaseData();
    //print('Displaying data from database is finished');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    print('initDB started execution');
    final dbPath = await getDatabasesPath();
    print('dbPath is taken');
    final path = join(dbPath, filePath);
    print('initDB is finished');

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    print('_createDb is getting executed');
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';

    await db.execute('''
    CREATE TABLE $tableNames (
      ${NameFields.id} $idType,
      ${NameFields.nameLat} $textType,
      ${NameFields.nameCyr} $textType,
      ${NameFields.isMaleName} $boolType,
      ${NameFields.meaning} $textType,
      ${NameFields.peopleWithThisName} $textType,
      ${NameFields.isFavorite} $boolType,
      ${NameFields.comingLang} $textType
    )
    ''');
    print('Database table is created');
    await _populateNamesDB(db);
    print('Database table is populated');

    print('_createDb is done executing');
  }

  Future<void> _populateNamesDB(Database db) async {
    //final db = await instance.database;

    final String response = await rootBundle.loadString(jsonDbPath);
    final data = await json.decode(response);
    List namesList = data['Sheet1'];

    for (int i = 0; i < namesList.length; i++) {
      print('Just before converting json data');
      var name = NameModel.fromJson(namesList[i], i);
      print('After converting json data into NameModel');
      await db.insert(
        tableNames,
        name.toJson(),
      );
      print('After inserting NameModel into database');
      print(
          'NameModel with ID ${name.id} and ${name.nameCyr} and gender is ${name.isMaleName} has been inserted');
    }
  }

  Future<void> displayDatabaseData() async {
    List<NameModel> names = await readAllNames();
    for (NameModel name in names) {
      print('''
      ${name.id},
      ${name.nameLat},
      ${name.nameCyr},
      ${name.isMaleName},
      ${name.meaning},
      ${name.peopleWithThisName},
      ${name.isFavorite},
      ${name.comingLang},
      /
      ''');
    }
  }

  Future<void> _addName(NameModel name) async {
    final db = await instance.database;

    final id = await db.insert(
      tableNames,
      name.toJson(),
    );
  }

  Future<NameModel> _readName(String id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableNames,
      columns: NameFields.values,
      where: '${NameFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return NameModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<int> updateName(NameModel name) async {
    final db = await instance.database;

    return db.update(
      tableNames,
      name.toJson(),
      where: '${NameFields.id} = ?',
      whereArgs: [name.id],
    );
  }

  Future<List<NameModel>> readAllNames() async {
    final db = await instance.database;

    //To sort by names in cyrill
    //final orderBy = '${NameFields.nameCyr} ASC';
    //final result = await db.query(tableNames, orderBy: orderBy);

    final result = await db.query(tableNames);

    return result.map((json) => NameModel.fromJson(json)).toList();
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<void> deleteDb(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    await databaseFactory.deleteDatabase(path);
  }
}
