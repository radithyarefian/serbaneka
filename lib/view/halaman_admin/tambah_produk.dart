import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:serbaneka/database/produk_controller.dart';
import 'package:serbaneka/model/produk_model.dart';

class TambahProduk extends StatefulWidget {
  const TambahProduk({super.key});

  @override
  State<TambahProduk> createState() => _TambahProdukState();
}

class _TambahProdukState extends State<TambahProduk> {
  final TextEditingController namaProdukController = TextEditingController();
  final TextEditingController kodeSkuController = TextEditingController();
  final TextEditingController hargaJualController = TextEditingController();
  final TextEditingController jumlahStokController = TextEditingController();
  final TextEditingController deskripsiProdukController =
      TextEditingController();

  File? imageFile;
  final ImagePicker picker = ImagePicker();

  String kategori = "ATK";

  final List<String> kategoriList = ["ATK", "Seragam", "Listrik"];

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
    }
  }

  Widget textField(
    String label,
    String hint,
    TextEditingController controller, {
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),

        const SizedBox(height: 8),

        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
        ),

        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              /// HEADER
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),

                  const SizedBox(width: 6),

                  const Text(
                    "TAMBAH BARANG",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// FOTO PRODUK
              const Text(
                "Foto Produk *",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 8),

              GestureDetector(
                onTap: () {
                  pickImage();
                },
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: imageFile == null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: 40,
                              color: Colors.deepPurple,
                            ),

                            SizedBox(height: 10),

                            Text(
                              "Ketuk untuk unggah",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            SizedBox(height: 4),

                            Text(
                              "Format: JPG, PNG (Maks. 5MB)",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            imageFile!,
                            width: double.infinity,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 20),

              /// NAMA PRODUK
              textField(
                "Nama Produk *",
                "Contoh: Buku Tulis Sidu Isi 38",
                namaProdukController,
              ),

              /// SKU
              textField("Kode SKU *", "Contoh: ATK-001", kodeSkuController),

              /// KATEGORI
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Kategori Produk",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),

                  const SizedBox(height: 8),

                  DropdownButtonFormField<String>(
                    initialValue: kategori,
                    items: kategoriList.map((item) {
                      return DropdownMenuItem(value: item, child: Text(item));
                    }).toList(),

                    onChanged: (value) {
                      setState(() {
                        kategori = value!;
                      });
                    },

                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),

              /// HARGA + STOK
              Row(
                children: [
                  Expanded(
                    child: textField("Harga Jual", "RP 0", hargaJualController),
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: textField(
                      "Jumlah Stok",
                      "0 Unit",
                      jumlahStokController,
                    ),
                  ),
                ],
              ),

              /// DESKRIPSI
              textField(
                "Deskripsi Produk",
                "Berikan detail tambahan mengenai produk ini ...",
                deskripsiProdukController,
                maxLines: 4,
              ),

              const SizedBox(height: 10),

              /// TOMBOL TAMBAH
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
                    if (namaProdukController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Nama Produk belum di isi"),
                        ),
                      );
                      return;
                    }

                    if (kodeSkuController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Kode SKU belum di isi")),
                      );
                      return;
                    }

                    if (hargaJualController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Harga Jual belum di isi"),
                        ),
                      );
                      return;
                    }

                    if (jumlahStokController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Jumlah Stok belum di isi"),
                        ),
                      );
                      return;
                    }

                    if (deskripsiProdukController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Deskripsi Produk belum di isi"),
                        ),
                      );
                      return;
                    }

                    if (imageFile == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Foto Produk belum dipilih"),
                        ),
                      );
                      return;
                    }

                    await ProdukController.registerProduk(
                      ProdukModel(
                        namaProduk: namaProdukController.text,
                        kodeSku: kodeSkuController.text,
                        kategoriProduk: kategori,
                        hargaJual: int.tryParse(hargaJualController.text) ?? 0,
                        jumlahStok: int.parse(jumlahStokController.text),
                        deskripsiProduk: deskripsiProdukController.text,
                        fotoProduk: imageFile?.path,
                      ),
                    );

                    Navigator.pop(context);
                  },

                  child: const Text(
                    "TAMBAH PRODUK",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              /// TOMBOL BATAL
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },

                  icon: const Icon(Icons.close, color: Colors.black),

                  label: const Text(
                    "BATALKAN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.black26),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
