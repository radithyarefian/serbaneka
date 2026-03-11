import 'package:flutter/material.dart';
import 'package:serbaneka/model/produk_model.dart';
import 'dart:io';
import 'package:serbaneka/database/produk_controller.dart';

class HapusProduk extends StatefulWidget {
    final ProdukModel produk;
  const HapusProduk({super.key,required this.produk});

  @override
  State<HapusProduk> createState() => _HapusProdukState();
}

class _HapusProdukState extends State<HapusProduk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          "HAPUS BARANG",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

            /// ICON WARNING
            const Icon(
              Icons.warning_amber_rounded,
              color: Colors.red,
              size: 70,
            ),

            const SizedBox(height: 20),

            /// TITLE
            const Text(
              "Konfirmasi Hapus",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            /// DESCRIPTION
            const Text(
              "Apakah Anda yakin ingin menghapus barang ini? "
              "Tindakan ini tidak dapat dibatalkan",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 15),
            ),

            const SizedBox(height: 25),

            /// PRODUCT CARD
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// PRODUCT IMAGE
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: (widget.produk.fotoProduk != null &&
                            File(widget.produk.fotoProduk!).existsSync())
                        ? Image.file(
                            File(widget.produk.fotoProduk!),
                            width: 70,
                            height: 90,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            width: 70,
                            height: 90,
                            color: Colors.grey.shade300,
                            child: const Icon(Icons.image),
                          ),
                  ),

                  const SizedBox(width: 15),

                  /// PRODUCT INFO
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.produk.namaProduk ?? "-",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          widget.produk.kategoriProduk ?? "-",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          "SKU: ${widget.produk.kodeSku ?? "-"}",
                          style: TextStyle(color: Colors.black45),
                        ),

                        const SizedBox(height: 10),

                        /// STOCK & PRICE
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text(
                                  "STOK",
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "${widget.produk.jumlahStok ?? 0} Unit",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

                            const SizedBox(width: 30),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text(
                                  "HARGA",
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "Rp ${widget.produk.hargaJual ?? 0}",
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// WARNING INFO
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(Icons.error_outline),

                SizedBox(width: 10),

                Expanded(
                  child: Text(
                    "Menghapus barang ini akan menghilangkan semua "
                    "catatan stok dan riwayat transaksi yang terkait "
                    "dengan identitas barang ini secara permanen dari "
                    "sistem inventaris",
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ],
            ),

            const Spacer(),

            /// DELETE BUTTON
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  await ProdukController.deleteProduk(widget.produk.id!);

                  Navigator.pop(context, true);
                },
                child: const Text(
                  "Ya, Hapus Sekarang",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// CANCEL BUTTON
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black54),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Batalkan",
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
}
