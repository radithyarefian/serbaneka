import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:serbaneka/database/produk_controller.dart';
import 'package:serbaneka/model/produk_model.dart';

class EditProduk extends StatefulWidget {
  final ProdukModel produk;
  const EditProduk({super.key, required this.produk});

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

  File? fotoBaru;
  final ImagePicker picker = ImagePicker();
  @override
  void initState() {
    super.initState();

    namaController.text = widget.produk.namaProduk ?? "";
    skuController.text = widget.produk.kodeSku ?? "";
    hargaController.text = widget.produk.hargaJual.toString();
    stokController.text = widget.produk.jumlahStok.toString();
    deskripsiController.text = widget.produk.deskripsiProduk ?? "";

    List<String> kategoriList = ["ATK", "Seragam", "Listrik"];

    if (kategoriList.contains(widget.produk.kategoriProduk)) {
      kategori = widget.produk.kategoriProduk!;
    } else {
      kategori = "ATK";
    }
  }

  Future<void> pilihFoto() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (image != null) {
      setState(() {
        fotoBaru = File(image.path);
      });
    }
  }

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
            GestureDetector(
              onTap: pilihFoto,
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade400),
                  color: Colors.grey.shade300,
                ),
                child: Stack(
                  children: [
                    /// FOTO PRODUK
                    if (fotoBaru != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          fotoBaru!,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      )
                    else if (widget.produk.fotoProduk != null &&
                        File(widget.produk.fotoProduk!).existsSync())
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(widget.produk.fotoProduk!),
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),

                    /// OVERLAY UBAH FOTO
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.edit, color: Colors.white, size: 16),
                            SizedBox(width: 5),
                            Text(
                              "Ubah Foto",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
                DropdownMenuItem(value: "Seragam", child: Text("Seragam")),
                DropdownMenuItem(value: "Listrik", child: Text("Listrik")),
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
                onPressed: () async {
                  final updatedProduk = ProdukModel(
                    id: widget.produk.id,
                    namaProduk: namaController.text,
                    kodeSku: skuController.text,
                    kategoriProduk: kategori,
                    hargaJual: int.parse(hargaController.text),
                    jumlahStok: int.parse(stokController.text),
                    deskripsiProduk: deskripsiController.text,
                    fotoProduk: fotoBaru?.path ?? widget.produk.fotoProduk,
                  );

                  await ProdukController.updateProduk(updatedProduk);

                  Navigator.pop(context, true);
                },
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
