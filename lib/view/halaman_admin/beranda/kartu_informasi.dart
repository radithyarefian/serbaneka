import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serbaneka/constant/app_color.dart';

class KartuInformasi extends StatefulWidget {
  const KartuInformasi({super.key});

  @override
  State<KartuInformasi> createState() => _KartuInformasiState();
}

class _KartuInformasiState extends State<KartuInformasi> {
  DateTimeRange? selectedDateRange;

  /// PICK DATE RANGE
  Future<void> _pickDateRange() async {
    DateTime now = DateTime.now();

    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      initialDateRange:
          selectedDateRange ?? DateTimeRange(start: now, end: now),
    );

    if (picked != null) {
      setState(() {
        selectedDateRange = picked;
      });
    }
  }

  /// FORMAT TEXT TANGGAL
  String getDateRangeText() {
    DateTime now = DateTime.now();

    DateTime start = selectedDateRange?.start ?? now;

    DateTime end = selectedDateRange?.end ?? now;

    List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "Mei",
      "Jun",
      "Jul",
      "Agu",
      "Sep",
      "Okt",
      "Nov",
      "Des",
    ];

    String format(DateTime date) {
      return "${date.day} "
          "${months[date.month - 1]} "
          "${date.year}";
    }

    if (start == end) {
      return format(start);
    }

    return "${format(start)} - ${format(end)}";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),

      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,

          borderRadius: BorderRadius.circular(16),

          border: Border.all(color: Colors.black.withOpacity(0.2)),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Column(
          children: [
            /// ========================
            /// ROW ATAS
            /// ========================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                /// TOTAL PRODUK
                Expanded(child: _totalProdukCard()),

                const SizedBox(width: 12),

                /// PRODUK HABIS
                Expanded(child: _produkHabisCard()),
              ],
            ),

            const SizedBox(height: 12),

            /// NILAI STOK
            _nilaiStokCard(),
          ],
        ),
      ),
    );
  }

  /// ========================
  /// WIDGET TOTAL PRODUK
  /// ========================

  Widget _totalProdukCard() {
    return SizedBox(
      height: 123,

      child: Container(
        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),

          border: Border.all(color: AppColor.kartuTotalProduk.withOpacity(0.2)),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(
              "Total Produk",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.7),
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "1,284",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 4),

            const Text(
              "+12 bulan ini",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColor.kartuTotalProduk,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ========================
  /// WIDGET PRODUK HABIS
  /// ========================

  Widget _produkHabisCard() {
    return SizedBox(
      height: 123,

      child: Container(
        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),

          border: Border.all(color: AppColor.kartuStokRendah3.withOpacity(0.2)),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const Text(
              "Produk Habis",
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: AppColor.kartuStokRendah3,
              ),
            ),

            const SizedBox(height: 6),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Text(
                  "10",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColor.kartuStokRendah3,
                  ),
                ),

                const SizedBox(width: 6),

                SvgPicture.asset(
                  "assets/images/beranda_admin/alert.svg",
                  width: 20,
                  height: 20,
                ),
              ],
            ),

            const SizedBox(height: 8),

            SizedBox(
              height: 32,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.kartuStokRendah3,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),

                onPressed: () {
                  print("Button Restock di Klik");
                },

                child: const Text(
                  "Restock →",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
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

  /// ========================
  /// WIDGET NILAI STOK
  /// ========================

  Widget _nilaiStokCard() {
    return SizedBox(
      width: 300,
      height: 113,

      child: Container(
        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),

          border: Border.all(color: AppColor.kartuNilaiStok.withOpacity(0.2)),
        ),

        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Text(
                "Nilai Stok",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                "Rp 45.2M",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 8),

              InkWell(
                borderRadius: BorderRadius.circular(6),
                onTap: () {
                   print("Tanggal Nilai Stok Di Klik");
                  _pickDateRange();
                },

                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),

                    border: Border.all(color: Colors.black.withOpacity(0.2)),
                  ),

                  child: Row(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      Text(
                        getDateRangeText(),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(width: 2),

                      const Icon(Icons.keyboard_arrow_down, size: 14),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
