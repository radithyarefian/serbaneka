import 'package:flutter/material.dart';

class AdminProduk extends StatefulWidget {
  const AdminProduk({super.key});

  @override
  State<AdminProduk> createState() => _AdminProdukState();
}

class _AdminProdukState extends State<AdminProduk> {
  String selectedCategory = "Semua";

  final List<String> categories = ["Semua", "ATK", "Seragam", "Listrik"];

  Widget categoryChip(String label) {
    bool active = selectedCategory == label;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = label;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
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
  }

  Widget statusBadge(String status) {
    Color bgColor;
    Color textColor;

    switch (status) {
      case "Tersedia":
        bgColor = Colors.green.shade100;
        textColor = Colors.green;
        break;
      case "Menipis":
        bgColor = Colors.orange.shade100;
        textColor = Colors.orange;
        break;
      default:
        bgColor = Colors.red.shade100;
        textColor = Colors.red;
    }

    return Container(
      margin: const EdgeInsets.only(top: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget productItem(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffe0e0e0))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// INFO PRODUK
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Buku Tulis Sidu Isi 38",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),

                const SizedBox(height: 4),

                const Text("ATK", style: TextStyle(color: Colors.grey)),

                const SizedBox(height: 4),

                const Text("Stok : 60", style: TextStyle(color: Colors.grey)),

                const SizedBox(height: 8),

                Row(
                  children: const [
                    Icon(Icons.edit, size: 18, color: Colors.deepPurple),
                    SizedBox(width: 4),
                    Text("Edit", style: TextStyle(color: Colors.deepPurple)),

                    SizedBox(width: 18),

                    Icon(Icons.delete, size: 18, color: Colors.red),
                    SizedBox(width: 4),
                    Text("Hapus", style: TextStyle(color: Colors.red)),
                  ],
                ),
              ],
            ),
          ),

          /// HARGA + STATUS (KANAN)
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                "RP 38.000",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),

              statusBadge(status),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {},
        child: const Icon(Icons.add),
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
                  children: categories.map((e) => categoryChip(e)).toList(),
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

              /// LIST PRODUK
              Expanded(
                child: ListView(
                  children: [
                    productItem("Tersedia"),
                    productItem("Menipis"),
                    productItem("Habis"),
                    productItem("Tersedia"),
                    productItem("Menipis"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
