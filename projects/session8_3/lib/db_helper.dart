// lib/db_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();

  static Database? _database;

  DBHelper._init();

  // Get database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  // Create table
  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE items (
      id $idType,
      name $textType,
      description $textType
    )
    ''');
  }

  // Insert an item
  Future<int> insertItem(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert('items', row);
  }

  // Query all items
  Future<List<Map<String, dynamic>>> queryAllItems() async {
    final db = await instance.database;
    return await db.query('items');
  }

  // Update an item
  Future<int> updateItem(Map<String, dynamic> row) async {
    final db = await instance.database;
    int id = row['id'];
    return await db.update('items', row, where: 'id = ?', whereArgs: [id]);
  }

  // Delete an item
  Future<int> deleteItem(int id) async {
    final db = await instance.database;
    return await db.delete('items', where: 'id = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
