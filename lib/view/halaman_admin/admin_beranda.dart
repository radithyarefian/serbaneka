import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serbaneka/constant/app_color.dart';

class AdminBeranda extends StatefulWidget {
  const AdminBeranda({super.key});

  @override
  State<AdminBeranda> createState() => _AdminBerandaState();
}

class _AdminBerandaState extends State<AdminBeranda> {
  DateTimeRange? selectedDateRange;

  Future<void> _pickDateRange() async {
    DateTime now = DateTime.now();

    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2026),
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

  String getDateRangeText() {
    DateTime now = DateTime.now();

    DateTime start = selectedDateRange?.start ?? now;

    DateTime end = selectedDateRange?.end ?? now;

    String format(DateTime date) {
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

      return "${date.day} ${months[date.month - 1]} ${date.year}";
    }

    if (start == end) {
      return format(start);
    }

    return "${format(start)} - ${format(end)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// =========================
          /// HEADER (STACK)
          /// =========================
          Stack(
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

              /// AVATAR + TEXT
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
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

                    /// TEXT 1
                    Text(
                      "Halo, Admin! 👋",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),

                    /// TEXT 2
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

              /// KARTU INFORMASI (DI LUAR STACK)
              Positioned(
                left: 10,
                right: 10,
                top: 205,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).scaffoldBackgroundColor, // putih sama dengan dasar Flutter

                      borderRadius: BorderRadius.circular(16),

                      border: Border.all(color: Colors.black.withOpacity(0.2)),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25), // 25%
                          blurRadius: 5,
                          spreadRadius: 0,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        /// ROW ATAS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// TOTAL PRODUK
                            Expanded(
                              child: SizedBox(
                                width: 145,
                                height: 123,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: AppColor.kartuTotalProduk
                                          .withOpacity(0.2),
                                    ),
                                  ),

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .center, // tengah vertikal
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center, // tengah horizontal
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
                                          color: Colors.black,
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
                              ),
                            ),

                            const SizedBox(width: 12),

                            /// PRODUK HABIS
                            Expanded(
                              child: SizedBox(
                                width: 145,
                                height: 123,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: AppColor.kartuProdukHabis
                                          .withOpacity(0.2),
                                    ),
                                  ),

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .center, // tengah vertikal
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center, // tengah horizontal
                                    children: [
                                      const Text(
                                        "Produk Habis",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.kartuProdukHabis,
                                        ),
                                      ),

                                      const SizedBox(height: 6),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center, // tengah vertikal
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center, // tengah horizontal
                                        children: [
                                          const Text(
                                            "10",
                                            style: TextStyle(
                                              fontFamily: "Inter",
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.kartuProdukHabis,
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
                                            backgroundColor:
                                                AppColor.kartuProdukHabis,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: const Text(
                                            "Restock →",
                                            style: TextStyle(
                                              fontFamily: "Inter",
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
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        /// NILAI STOK
                        SizedBox(
                          width: 300,
                          height: 113,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: AppColor.kartuNilaiStok.withOpacity(0.2),
                              ),
                            ),

                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Nilai Stok",
                                    textAlign: TextAlign.center,
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
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  InkWell(
                                    borderRadius: BorderRadius.circular(6),
                                    onTap: _pickDateRange,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),

                                      decoration: BoxDecoration(
                                        color: Theme.of(
                                          context,
                                        ).scaffoldBackgroundColor,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.black.withOpacity(0.2),
                                        ),
                                      ),

                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            getDateRangeText(),
                                            style: const TextStyle(
                                              fontFamily: "Inter",
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),

                                          const SizedBox(width: 2),

                                          const Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 14,
                                            color: Colors.black,
                                          ),
                                        ],
                                      ),
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
              ),
            ],
          ),

          const SizedBox(height: 110),

          /// TEXT AKTIFITAS TERAKHIR
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
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
