import 'dart:io';

import 'package:flutter/material.dart';
import 'package:serbaneka/database/produk_controller.dart';
import 'package:serbaneka/model/produk_model.dart';
import 'package:serbaneka/view/halaman_admin/edit_produk.dart';
import 'package:serbaneka/view/halaman_admin/hapus_produk.dart';
import 'package:serbaneka/view/halaman_admin/tambah_produk.dart';

class AdminProduk extends StatefulWidget {
  const AdminProduk({super.key});

  @override
  State<AdminProduk> createState() => _AdminProdukState();
}

class _AdminProdukState extends State<AdminProduk> {
  String selectedCategory = "Semua";

  final List<String> categories = ["Semua", "ATK", "Seragam", "Listrik"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TambahProduk()),
          ).then((value) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              /// HEADER
              Row(
                children: const [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.inventory_2, color: Colors.white),
                  ),
                  SizedBox(width: 12),
                  Text(
                    "Daftar Produk",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// SEARCH
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: "Cari produk, SKU, atau kategori ...",
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// FILTER KATEGORI
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((label) {
                    bool active = selectedCategory == label;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = label;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: active ? Colors.deepPurple : Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Text(
                          label,
                          style: TextStyle(
                            color: active ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                "MENAMPILKAN 5 PRODUK",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: FutureBuilder<List<ProdukModel>>(
                  future: ProdukController.getAllProduk(),

                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child :CircularProgressIndicator());
                    }
                    final dataProduk = snapshot.data as List<ProdukModel>;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: dataProduk.length,
                      itemBuilder: (BuildContext context, int index) {
                        final items = dataProduk[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.black12),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// FOTO PRODUK
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child:
                                    (items.fotoProduk != null &&
                                        File(items.fotoProduk!).existsSync())
                                    ? Image.file(
                                        File(items.fotoProduk!),
                                        width: 70,
                                        height: 70,
                                        fit: BoxFit.cover,
                                      )
                                    : Container(
                                        width: 70,
                                        height: 70,
                                        color: Colors.grey.shade300,
                                        child: const Icon(Icons.image),
                                      ),
                              ),

                              const SizedBox(width: 12),

                              /// INFORMASI PRODUK
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// NAMA PRODUK
                                    Text(
                                      items.namaProduk ?? "-",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),

                                    const SizedBox(height: 2),

                                    /// KATEGORI
                                    Text(
                                      items.kategoriProduk ?? "-",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),

                                    const SizedBox(height: 4),

                                    /// STOK
                                    Text(
                                      "Stok : ${items.jumlahStok ?? 0}",
                                      style: const TextStyle(
                                        color: Colors.black54,
                                      ),
                                    ),

                                    const SizedBox(height: 6),

                                    /// EDIT DAN HAPUS
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            final result = await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EditProduk(produk: items),
                                              ),
                                            );

                                            if (result == true) {
                                              setState(() {});
                                            }
                                          },
                                          child: const Row(
                                            children: [
                                              Icon(
                                                Icons.edit,
                                                size: 18,
                                                color: Colors.blue,
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                "Edit",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        const SizedBox(width: 16),

                                        InkWell(
                                           onTap: () async {
                                            final result = await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    HapusProduk(produk: items),
                                              ),
                                            );
                                            if (result == true) {
                                              setState(() {});
                                            }
                                          },
                                          child: const Row(
                                            children: [
                                              Icon(
                                                Icons.delete,
                                                size: 18,
                                                color: Colors.red,
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                "Hapus",
                                                style: TextStyle(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              /// HARGA + STATUS
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  /// HARGA
                                  Text(
                                    "RP ${items.hargaJual ?? 0}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),

                                  const SizedBox(height: 15),

                                  /// STATUS STOK
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: (items.jumlahStok ?? 0) > 20
                                          ? Colors.green.shade100
                                          : (items.jumlahStok ?? 0) > 5
                                          ? Colors.orange.shade100
                                          : Colors.red.shade100,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      (items.jumlahStok ?? 0) > 20
                                          ? "Tersedia"
                                          : (items.jumlahStok ?? 0) > 5
                                          ? "Menipis"
                                          : "Habis",
                                      style: TextStyle(
                                        color: (items.jumlahStok ?? 0) > 20
                                            ? Colors.green
                                            : (items.jumlahStok ?? 0) > 5
                                            ? Colors.orange
                                            : Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
