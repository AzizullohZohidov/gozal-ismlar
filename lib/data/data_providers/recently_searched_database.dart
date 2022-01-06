import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gozal_ismlar/data/models/name_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RecentlySearchedDatabase {
  final String dbName = 'recently_searched.db';

  static final RecentlySearchedDatabase instance =
      RecentlySearchedDatabase._init();

  static Database? _database;

  RecentlySearchedDatabase._init();

  Future<Database> get database async {
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

    await db.execute('''
    CREATE TABLE $tableRecentlySearchedNames (
      ${RecentlySearchedNameFields.id} $idType,
      ${RecentlySearchedNameFields.searchedName} $textType
    )
    ''');
    print('Database table is created');

    print('_createDb is done executing');
  }

  Future<void> addRecName(String recName) async {
    final db = await instance.database;

    await db.insert(
      tableRecentlySearchedNames,
      nameToJson(recName),
    );
  }

  Future<NameModel> _readRecName(String id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableRecentlySearchedNames,
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

  Future<List<String>> readAllRecNames() async {
    final db = await instance.database;
    List<String> recentlySearchedNames = [];

    final result = await db.query(tableRecentlySearchedNames);

    recentlySearchedNames = result
        .map(
          (json) => json[RecentlySearchedNameFields.searchedName] as String,
        )
        .toList() as List<String>;
    return recentlySearchedNames;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<void> clearDb() async {
    final db = await instance.database;
    await db.delete(tableRecentlySearchedNames);
  }

  Future<void> deleteDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    await databaseFactory.deleteDatabase(path);
  }

  Map<String, Object?> nameToJson(String name) => {
        RecentlySearchedNameFields.searchedName: name,
      };
}
