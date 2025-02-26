// lib/database_helper.dart
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the database if it's not already
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    // Open the database and create table if it doesn't exist
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Create a table called 'items'
  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE items(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        description TEXT
      )
    ''');
  }

  // Insert a new item
  Future<int> insertItem(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert('items', row);
  }

  // Query all items
  Future<List<Map<String, dynamic>>> queryAllItems() async {
    Database db = await database;
    return await db.query('items');
  }

  // Update an item
  Future<int> updateItem(Map<String, dynamic> row) async {
    Database db = await database;
    int id = row['id'];
    return await db.update('items', row, where: 'id = ?', whereArgs: [id]);
  }

  // Delete an item
  Future<int> deleteItem(int id) async {
    Database db = await database;
    return await db.delete('items', where: 'id = ?', whereArgs: [id]);
  }
}
