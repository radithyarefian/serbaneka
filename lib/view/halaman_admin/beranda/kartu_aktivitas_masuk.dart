import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serbaneka/constant/app_color.dart';

class KartuAktivitasMasuk extends StatelessWidget {
  final String namaProduk;
  final String kategori;
  final String jumlah;

  const KartuAktivitasMasuk({
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
          print("Kartu Aktivitas Masuk di Klik");
        },

        child: Row(
          children: [
            /// ICON PANAH MASUK
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: AppColor.bgMasuk, // hijau muda
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  "assets/images/beranda_admin/masuk.svg",
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

            /// JUMLAH MASUK
            Row(
              children: [
                Text(
                  "+$jumlah",
                  style: const TextStyle(
                    fontFamily: "Inter",
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColor.masuk, // hijau
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
