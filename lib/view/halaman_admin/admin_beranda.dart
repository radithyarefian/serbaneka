import 'package:flutter/material.dart';
import 'package:serbaneka/view/halaman_admin/beranda/kartu_informasi.dart';
import 'package:serbaneka/view/halaman_admin/beranda/kartu_aktivitas_masuk.dart';
import 'package:serbaneka/view/halaman_admin/beranda/kartu_peringatan_stok.dart';
import 'package:serbaneka/view/halaman_admin/beranda/lartu_aktivitas_keluar.dart';

class AdminBeranda extends StatefulWidget {
  const AdminBeranda({super.key});

  @override
  State<AdminBeranda> createState() => _AdminBerandaState();
}

class _AdminBerandaState extends State<AdminBeranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// =========================
            /// HEADER + STACK AREA
            /// =========================
            SizedBox(
              height: 480,

              child: Stack(
                clipBehavior: Clip.none,

                children: [
                  /// BACKGROUND GRADIENT
                  Container(
                    width: double.infinity,
                    height: 400,

                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,

                        colors: [
                          const Color(0xFF7B6EF6),

                          Theme.of(context).scaffoldBackgroundColor,
                        ],
                      ),
                    ),
                  ),

                  /// =========================
                  /// AVATAR + GREETING
                  /// =========================
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 60,
                      left: 20,
                      right: 20,
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        /// AVATAR
                        Container(
                          width: 45,
                          height: 45,

                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),

                                blurRadius: 10,

                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// GREETING TEXT
                        const Text(
                          "Halo, Admin! 👋",

                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),

                        Text(
                          "Berikut ringkasan inventaris hari ini",

                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// =========================
                  /// KARTU INFORMASI
                  /// (dipanggil dari file terpisah)
                  /// =========================
                  Positioned(
                    left: 10,
                    right: 10,
                    top: 205,

                    child: KartuInformasi(),
                  ),
                ],
              ),
            ),

            /// JARAK DARI STACK
            const SizedBox(height: 40),

            /// =========================
            /// TITLE AKTIVITAS
            /// =========================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: Align(
                alignment: Alignment.centerLeft,

                child: Text(
                  "Aktifitas Terakhir",

                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.8,

                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            /// =========================
            /// LIST AKTIVITAS
            /// =========================
            Column(
              children: [
                /// MASUK
                const KartuAktivitasMasuk(
                  namaProduk: "Kertas A4 Sinar Dunia",
                  kategori: "Stationery",
                  jumlah: "10 Rim",
                ),

                const SizedBox(height: 8),

                /// KELUAR
                const KartuAktivitasKeluar(
                  namaProduk: "Pulpen Standard AE7",
                  kategori: "Stationery",
                  jumlah: "5 Pcs",
                ),

                const SizedBox(height: 8),

                const KartuAktivitasKeluar(
                  namaProduk: "Pulpen Standard AE7",
                  kategori: "Stationery",
                  jumlah: "5 Pcs",
                ),

                const SizedBox(height: 8),

                const KartuAktivitasKeluar(
                  namaProduk: "Pulpen Standard AE7",
                  kategori: "Stationery",
                  jumlah: "5 Pcs",
                ),

                const SizedBox(height: 20),

                /// =========================
                /// PERINGATAN STOK
                /// =========================
                const KartuPeringatanStokRendah(jumlahProduk: 8),
              ],
            ),

            /// SPACING BAWAH
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
