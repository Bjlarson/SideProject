import 'dart:core';
import 'dart:core' as prefix0;
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:side_project/counterClass.dart';


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
    await db.execute("CREATE TABLE streak_counter(id INTEGER PRIMARY KEY, name TEXT, count INTEGER, lastUpdateTime DATETIME)");
  });
}

//insert a new counter
newCounter(Counter counter) async{
  final db = await database;  

//insert
Future<void> insertCounter(Counter counter) async {

  final Database db = await database;

  var raw = await db.rawInsert("INSERT INTO streak_counter(name, count, lastUpdateTime)"
  " VALUES(?,?,?)", [counter.counterName, counter.count, counter.lastUpdateTime]);

  return raw;
}

//update
Future<void> updateCounter(Counter counter) async {
  final db = await database;

  await db.update(
    'streak_counter',
    counter.toMap(),
    where: "name = ?",
    whereArgs: [counter.counterName],
    );
}

//Retrieve
/*
Future<List<Counter>> counter() async {
    final Database db = await database;
    final List<Map<String ,dynamic>> maps = await db.query('streak_counter');

    return List.generate(maps.length, (i) {
      return Counter(
      count: maps[i]['count'],
      lastUpdateTime: maps[i]['lastUpdateTime'],
      counterName: maps[i]['counterName'],

      );
    });
}
*/

//delete the counter from the database
Future<void> deleteCounter(String name) async {

  final db = await database;

  await db.delete(
    'streak_counter',
    where: "counterName = ?",
    whereArgs: [name],
  );
}
}

//update the lastUpdateTime

//update the counter if failed to increment the counter.