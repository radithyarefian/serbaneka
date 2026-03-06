import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'serbaneka.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE login_admin (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT)',
        );
      },
      version: 1,
    );
  }
}
