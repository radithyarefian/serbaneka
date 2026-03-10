import 'package:flutter/material.dart';
import 'package:serbaneka/database/produk_controller.dart';
import 'package:serbaneka/model/produk_model.dart';
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
                      return CircularProgressIndicator();
                    }
                    final dataProduk = snapshot.data as List<ProdukModel>;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: dataProduk.length,
                      itemBuilder: (BuildContext context, int index) {
                        final items = dataProduk[index];
                        return ListTile(
                          title: Text(items.namaProduk ?? "-"),
                          subtitle: Text(items.kategoriProduk ?? "-"),
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

