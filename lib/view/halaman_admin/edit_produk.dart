import 'package:flutter/material.dart';

class EditProduk extends StatefulWidget {
  const EditProduk({super.key});

  @override
  State<EditProduk> createState() => _EditProdukState();
}

class _EditProdukState extends State<EditProduk> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController skuController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController stokController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();

  String kategori = "ATK";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          "EDIT BARANG",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// FOTO PRODUK
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.deepPurple,
                    size: 40,
                  ),
                  SizedBox(height: 10),
                  Text("Ubah Foto Produk", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// NAMA PRODUK
            const Row(
              children: [
                Icon(Icons.inventory_2_outlined, color: Colors.deepPurple),
                SizedBox(width: 8),
                Text(
                  "Nama Produk",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: namaController,
              decoration: inputDecoration("Buku Tulis Sidu Isi 38"),
            ),

            const SizedBox(height: 18),

            /// SKU
            const Row(
              children: [
                Icon(Icons.view_column, color: Colors.deepPurple),
                SizedBox(width: 8),
                Text(
                  "Nomor SKU (Stock Keeping Unit)",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: skuController,
              decoration: inputDecoration("ATK-SDU-001"),
            ),

            const SizedBox(height: 18),

            /// KATEGORI
            const Row(
              children: [
                Icon(Icons.sell_outlined, color: Colors.deepPurple),
                SizedBox(width: 8),
                Text("Kategori", style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: kategori,
              decoration: inputDecoration(""),
              items: const [
                DropdownMenuItem(value: "ATK", child: Text("ATK")),
                DropdownMenuItem(
                  value: "Elektronik",
                  child: Text("Elektronik"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  kategori = value!;
                });
              },
            ),

            const SizedBox(height: 18),

            /// HARGA DAN STOK
            Row(
              children: [
                /// HARGA
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.wallet_outlined, color: Colors.deepPurple),
                          SizedBox(width: 8),
                          Text(
                            "Harga (Rp)",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: hargaController,
                        keyboardType: TextInputType.number,
                        decoration: inputDecoration("38.000"),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 15),

                /// STOK
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.layers_outlined, color: Colors.deepPurple),
                          SizedBox(width: 8),
                          Text(
                            "Stok",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: stokController,
                        keyboardType: TextInputType.number,
                        decoration: inputDecoration("60"),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            /// DESKRIPSI
            const Row(
              children: [
                Icon(Icons.info_outline, color: Colors.deepPurple),
                SizedBox(width: 8),
                Text(
                  "Deskripsi Produk",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: deskripsiController,
              maxLines: 4,
              decoration: inputDecoration(
                "Buku tulis berkualitas tinggi merk Sidu dengan isi 38 lembar. Cocok untuk kebutuhan sekolah dan kantor.",
              ),
            ),

            const SizedBox(height: 25),

            /// INFO TEXT
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(Icons.inventory, color: Colors.deepPurple),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Informasi yang Anda masukkan akan langsung diperbarui di inventaris pusat setelah Anda menekan tombol Simpan",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// BUTTON SIMPAN
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "SIMPAN PERUBAHAN",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// BUTTON BATAL
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "BATAL",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey.shade500),
      filled: true,
      fillColor: Colors.grey.shade200,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
    );
  }
}
