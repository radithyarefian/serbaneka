import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serbaneka/constant/app_color.dart';

class KartuPeringatanStokRendah extends StatelessWidget {
  final int jumlahProduk;

  const KartuPeringatanStokRendah({super.key, required this.jumlahProduk});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 325,

        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: AppColor.kartuProdukHabis,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ICON
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: SvgPicture.asset(
                "assets/images/beranda_admin/warning.svg",
                width: 30,
                height: 28,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFDC3545),
                  BlendMode.srcIn,
                ),
              ),
            ),

            const SizedBox(width: 14),

            /// TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Peringatan Stok Rendah",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColor.kartuStokRendah1,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "$jumlahProduk produk perlu segera dipesan ulang untuk menjaga ketersediaan stok barang",
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontSize: 12,
                      height: 1.3,
                      color: AppColor.kartuStokRendah2,
                    ),
                  ),

                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      print("Cek Daftar Produk diKlik");
                    },

                    style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.zero, // supaya rapat seperti Text biasa
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),

                    child: const Text(
                      "Cek Daftar Produk",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColor.kartuStokRendah3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
