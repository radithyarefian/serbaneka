import 'package:path/path.dart';
import 'package:serbaneka/model/admin_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'serbaneka.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE admin (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT)',
        );
        await db.execute(
          'CREATE TABLE produk (id INTEGER PRIMARY KEY AUTOINCREMENT, namaProduk TEXT, kodeSku TEXT, kategoriProduk TEXT,  hargaJual INTEGER, jumlahStok INTEGER, deskripsiProduk TEXT)',
        );
      },
      version: 2,
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute(
            'CREATE TABLE produk (id INTEGER PRIMARY KEY AUTOINCREMENT, namaProduk TEXT, kodeSku TEXT, kategoriProduk TEXT,  hargaJual INTEGER, jumlahStok INTEGER, deskripsiProduk TEXT)',
          );
        }
      },
    );
  }

  static Future<void> registerAdmin(AdminModel admin) async {
    final dbs = await db();

    await dbs.insert('admin', admin.toMap());
    print(admin.toMap());
  }

  static Future<AdminModel?> loginAdmin({
    required String email,
    required String password,
  }) async {
    final dbs = await db();
    final List<Map<String, dynamic>> results = await dbs.query(
      "admin",
      where: 'email =  ? AND password = ? ',
      whereArgs: [email, password],
    );
    if (results.isNotEmpty) {
      final data = AdminModel.fromMap(results.first);
      print(data.id);
      print(data.email);
      print(data.password);
      print(AdminModel.fromMap(results.first));
      return AdminModel.fromMap(results.first);
    }
    return null;
  }

  static Future<AdminModel?> getData() async {
    final dbs = await db();
    final List<Map<String, dynamic>> results = await dbs.query("admin");
    if (results.isNotEmpty) {
      final data = AdminModel.fromMap(results.first);
      print(data.id);
      print(data.email);
      print(data.password);
      print(AdminModel.fromMap(results.first));
      print(results);
      return AdminModel.fromMap(results.first);
    }
    return null;
  }
}
