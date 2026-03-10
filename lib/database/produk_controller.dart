import 'package:serbaneka/database/sqflite.dart';
import 'package:serbaneka/model/produk_model.dart';

class ProdukController {
  static Future<void> registerProduk(ProdukModel produk) async {
    final dbs = await DBHelper.db();
    await dbs.insert('produk', produk.toMap());
    print(produk.toMap());
  }

  static Future<List<ProdukModel>> getAllProduk() async {
    final dbs = await DBHelper.db();
    final List<Map<String, dynamic>> results = await dbs.query("produk");
    print(results.map((e) => ProdukModel.fromMap(e)).toList());
    return results.map((e) => ProdukModel.fromMap(e)).toList();
  }
}
