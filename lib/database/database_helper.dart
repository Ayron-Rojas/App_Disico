import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return database;
    _database = await _initDB('epp.db');
    return _database!;
  }

  Future<Database> _initDB(String filepath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const intType = 'INTEGER NOT NULL';

    await db.execute('''
      CREATE TABLE epp(
        id $idType,
        tipo $textType,
        cantidad $intType,
        proveedor $textType,
        fechaIngreso $textType)
        ''');
  }

  Future<int> insertEPP(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert('epp', row);
  }

  Future<List<Map<String, dynamic>>> queryALLEPP() async {
    final db = await instance.database;
    return await db.query('epp');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}