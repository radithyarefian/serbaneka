import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serbaneka/constant/app_color.dart';

class KartuAktivitasKeluar extends StatelessWidget {
  final String namaProduk;
  final String kategori;
  final String jumlah;

  const KartuAktivitasKeluar({
    super.key,
    required this.namaProduk,
    required this.kategori,
    required this.jumlah,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          print("Kartu Aktivitas keluar di Klik");
        },

        child: Row(
          children: [
            /// ICON PANAH KELUAR
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: AppColor.bgKeluar, // 🔴 merah muda
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/images/beranda_admin/keluar.svg",
                  width: 15,
                  height: 15,
                ),
              ),
            ),

            const SizedBox(width: 14),

            /// TEXT PRODUK
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    namaProduk,
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    kategori,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),

            /// JUMLAH KELUAR
            Row(
              children: [
                Text(
                  "-$jumlah",
                  style: const TextStyle(
                    fontFamily: "Inter",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColor.keluar, // 🔴 merah
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
