import 'dart:convert';

class ProdukModel {
  final int? id;
  final String? namaProduk;
  final String? kodeSku;
  final String? kategoriProduk;
  final int? hargaJual;
  final int? jumlahStok;
  final String? deskripsiProduk;
  final String? fotoProduk;
  ProdukModel({
    this.id,
    this.namaProduk,
    this.kodeSku,
    this.kategoriProduk,
    this.hargaJual,
    this.jumlahStok,
    this.deskripsiProduk,
    this.fotoProduk,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'namaProduk': namaProduk,
      'kodeSku': kodeSku,
      'kategoriProduk': kategoriProduk,
      'hargaJual': hargaJual,
      'jumlahStok': jumlahStok,
      'deskripsiProduk': deskripsiProduk,
      'fotoProduk': fotoProduk,
    };
  }

  factory ProdukModel.fromMap(Map<String, dynamic> map) {
    return ProdukModel(
      id: map['id']?.toInt(),
      namaProduk: map['namaProduk'],
      kodeSku: map['kodeSku'],
      kategoriProduk: map['kategoriProduk'],
      hargaJual: map['hargaJual']?.toInt(),
      jumlahStok: map['jumlahStok']?.toInt(),
      deskripsiProduk: map['deskripsiProduk'],
      fotoProduk: map['fotoProduk'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProdukModel.fromJson(String source) =>
      ProdukModel.fromMap(json.decode(source));
}
