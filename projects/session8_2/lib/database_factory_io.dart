// filepath: /C:/Storage/Repositories/SocratesFlutter/projects/session8_2/lib/database_factory_io.dart
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';

DatabaseFactory getDatabaseFactory() {
  sqfliteFfiInit();
  return databaseFactoryFfi;
}