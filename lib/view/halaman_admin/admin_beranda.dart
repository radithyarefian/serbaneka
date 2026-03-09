import 'package:flutter/material.dart';

class AdminBeranda extends StatefulWidget {
  const AdminBeranda({super.key});

  @override
  State<AdminBeranda> createState() => _AdminBerandaState();
}

class _AdminBerandaState extends State<AdminBeranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// BACKGROUND GRADIENT ///
          Container(
            width: double.infinity,
            height: 450,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF7B6EF6), Color(0xFFFFFFFF)],
                stops: [0.0, 1.0],
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// header section ///
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 100, 20, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Halo, Admin! 👋",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),

                          Text(
                            "Berikut ringkasan inventaris hari ini",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  /// Summary Card ///
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE5E5E5), // fill
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Colors.black.withOpacity(
                              0.2,
                            ), // stroke hitam 20%
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  const Text(
                                    "TOTAL PRODUK",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: Colors.grey,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  const SizedBox(height: 4),

                                  const Text(
                                    "1,284",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),

                                  const Text(
                                    "+12 bulan ini",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      color: Color(0xFF5FC6CE),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),

                            const Divider(),

                            const SizedBox(height: 16),

                            Row(
                              children: [
                                // Kolom Produk Habis
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "PRODUK HABIS",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        "8",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Garis vertikal
                                Container(
                                  width: 2,
                                  height:
                                      50, // sesuaikan tinggi garis dengan konten
                                  color: Colors.grey.withOpacity(0.5),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 35,
                                  ), // spasi kiri kanan
                                ),

                                // Kolom Nilai Stok
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "NILAI STOK",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "Rp45.2M",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
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
                    ),
                  ),

                  // Title Aktivitas
                  const SizedBox(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(25, 24, 20, 12),
                      child: Text(
                        "AKTIVITAS TERAKHIR",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),

                  // Aktivitas List
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          // Item 1
                          Row(
                            children: [
                              // Icon Bulat
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: const Color(
                                    0xFF5FC6CE,
                                  ), // bisa ganti warna icon
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.inventory_2, // contoh icon
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),

                              const SizedBox(width: 12),

                              // Nama Produk & Kategori
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Buku Tulis",
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      "Stationery",
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Jumlah Perubahan Stok
                              const Text(
                                "+10",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),

                              const SizedBox(width: 12),

                              // Arrow kanan
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ],
                          ),

                          const SizedBox(height: 16), // jarak antar item
                          // Item 2 (contoh lain)
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.inventory_2,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Pulpen",
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      "Stationery",
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Text(
                                "-5",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.grey,
                              ),
                            ],
                          ),

                          // Bisa tambahkan item lain dengan cara sama
                        ],
                      ),
                    ),
                  ),

                  // Warning Card
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE5E5), // soft red background
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.red.withOpacity(
                              0.3,
                            ), // stroke merah tipis
                            width: 1,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Icon warning
                            const Icon(
                              Icons.warning_amber_rounded,
                              color: Colors.red,
                              size: 28,
                            ),

                            const SizedBox(width: 12),

                            // Text warning
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Stok Rendah",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Beberapa produk hampir habis, segera lakukan restock!",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 13,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
