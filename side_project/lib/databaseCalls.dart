import 'dart:core';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class CounterDatabase{
  CounterDatabase._();
  static final CounterDatabase cdb = CounterDatabase._();
}

Database _database;

Future<Database> get database async{
  if(_database != null)
  return _database;

  _database = await initDB();
  return _database;
}

initDB() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();

  String path = join(documentsDirectory.path, "streak_counter.db");

  return await openDatabase(path, version: 1, onOpen: (db){}, 
  onCreate: (Database db, int version) async {
    await db.execute("CREATE TABLE streak_counter(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, count INTEGER, lastUpdateTime DATETIME)");
  });
}


//insert

//update

//delete