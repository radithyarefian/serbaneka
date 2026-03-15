import 'package:flutter/material.dart';

class TambahProdukPelanggan extends StatefulWidget {
  const TambahProdukPelanggan({super.key});

  @override
  State<TambahProdukPelanggan> createState() => _TambahProdukPelangganState();
}

class _TambahProdukPelangganState extends State<TambahProdukPelanggan> {
  int jumlah = 1;
  int selectedVariasi = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFFEDEDED),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            /// HANDLE
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            const SizedBox(height: 15),

            /// PRODUK
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                const SizedBox(width: 15),

                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rp 100.000",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2FA7A4),
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Stok: 120",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    )
                  ],
                )
              ],
            ),

            const SizedBox(height: 15),

            const Divider(),

            /// VARIASI
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Variasi",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [

                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedVariasi = 0;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: selectedVariasi == 0
                            ? const Color(0xFF2FA7A4)
                            : Colors.grey,
                      ),
                    ),
                    child: const Text("Isi 38"),
                  ),
                ),

                const SizedBox(width: 10),

                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedVariasi = 1;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: selectedVariasi == 1
                            ? const Color(0xFF2FA7A4)
                            : Colors.grey,
                      ),
                    ),
                    child: const Text("Isi 58"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            const Divider(),

            /// JUMLAH
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                const Text(
                  "Jumlah",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black38),
                  ),
                  child: Row(
                    children: [

                      IconButton(
                        icon: const Icon(Icons.remove, size: 18),
                        onPressed: () {
                          if (jumlah > 1) {
                            setState(() {
                              jumlah--;
                            });
                          }
                        },
                      ),

                      Text(
                        jumlah.toString(),
                        style: const TextStyle(
                          color: Color(0xFF2FA7A4),
                          fontSize: 16,
                        ),
                      ),

                      IconButton(
                        icon: const Icon(Icons.add, size: 18),
                        onPressed: () {
                          setState(() {
                            jumlah++;
                          });
                        },
                      ),

                    ],
                  ),
                )
              ],
            ),

            const SizedBox(height: 20),

            /// BUTTON
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2FA7A4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Masukkan Keranjang",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
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