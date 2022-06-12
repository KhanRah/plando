import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseSetup {
  static Database? _database;

  Future<Database?> get db async {
    if (_database != null && _database!.isOpen) {
      return _database;
    }
    _database = await initDb();

    return _database;
  }

  String table = "dataTable";

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'listData.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int dbVersion) async {
    await db.execute("CREATE TABLE $table(_id TEXT PRIMARY KEY,name TEXT,age INTEGER,colour TEXT)");
  }

}