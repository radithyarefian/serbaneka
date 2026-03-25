import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AdminLaporan extends StatefulWidget {
  const AdminLaporan({super.key});

  @override
  State<AdminLaporan> createState() => _AdminLaporanState();
}

class _AdminLaporanState extends State<AdminLaporan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.analytics, color: Colors.white),
                  ),

                  const SizedBox(width: 12),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Laporan Bisnis",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 3),

                      Text(
                        "Data terupdate hari ini",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  const Spacer(),

                  const Icon(Icons.refresh),
                ],
              ),

              const SizedBox(height: 20),

              /// PERIODE ANALISIS
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(14),
                ),

                child: Row(
                  children: [
                    const Icon(Icons.calendar_month, color: Colors.deepPurple),

                    const SizedBox(width: 10),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "PERIODE ANALISIS",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),

                        Text(
                          "01 Okt - 07 Okt 2023",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    const Spacer(),

                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// CARD STATISTIK
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                physics: const NeverScrollableScrollPhysics(),

                children: [
                  /// TOTAL PENJUALAN
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xffECE9FF),
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.deepPurple.shade100,
                          child: const Icon(
                            Icons.shopping_cart,
                            color: Colors.deepPurple,
                          ),
                        ),

                        const SizedBox(height: 12),

                        const Text(
                          "TOTAL PENJUALAN",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),

                        const SizedBox(height: 4),

                        const Text(
                          "RP 12.4M",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// PENDAPATAN BERSIH
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xffECE9FF),
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.deepPurple.shade100,
                          child: const Icon(
                            Icons.attach_money,
                            color: Colors.deepPurple,
                          ),
                        ),

                        const SizedBox(height: 12),

                        const Text(
                          "PENDAPATAN BERSIH",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),

                        const SizedBox(height: 4),

                        const Text(
                          "RP 8.2M",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// PRODUK TERLARIS
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xffECE9FF),
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.deepPurple.shade100,
                          child: const Icon(
                            Icons.inventory_2,
                            color: Colors.deepPurple,
                          ),
                        ),

                        const SizedBox(height: 12),

                        const Text(
                          "PRODUK TERLARIS",
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),

                        const SizedBox(height: 4),

                        const Text(
                          "452 Unit",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// TARGET MINGGUAN
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xffECE9FF),
                      borderRadius: BorderRadius.circular(18),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "TARGET MINGGUAN",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.deepPurple,
                          ),
                        ),

                        const SizedBox(height: 6),

                        const Row(
                          children: [
                            Text(
                              "85%",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(width: 5),

                            Text("Tercapai"),
                          ],
                        ),

                        const SizedBox(height: 10),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: LinearProgressIndicator(
                            value: 0.85,
                            minHeight: 8,
                            backgroundColor: Colors.white,
                            color: Colors.deepPurple,
                          ),
                        ),

                        const SizedBox(height: 5),

                        const Text(
                          "Sisa 15% lagi",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// JUDUL GRAFIK
              const Text(
                "Tren Pendapatan",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const Text(
                "Statistik harian dalam satu minggu terakhir",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 12),

              /// CHART
              SizedBox(
                height: 220,

                child: LineChart(
                  LineChartData(
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(show: true),
                    titlesData: FlTitlesData(show: false),

                    lineBarsData: [
                      LineChartBarData(
                        isCurved: true,
                        barWidth: 3,
                        color: Colors.deepPurple,
                        dotData: FlDotData(show: true),

                        spots: const [
                          FlSpot(0, 2),
                          FlSpot(1, 3),
                          FlSpot(2, 2.5),
                          FlSpot(3, 4),
                          FlSpot(4, 5),
                          FlSpot(5, 6),
                          FlSpot(6, 5.5),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// HEADER STOK RENDAH
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.warning, color: Colors.red),

                      SizedBox(width: 6),

                      Text(
                        "Peringatan Stok Rendah",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Text("3 Item"),
                ],
              ),

              const SizedBox(height: 12),

              /// ITEM 1
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(10),

                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(14),
                ),

                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.shade100,
                      ),
                      child: const Icon(Icons.book, size: 30),
                    ),

                    const SizedBox(width: 12),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Buku Tulis Sidu Isi 38",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),

                          Text(
                            "Alat Tulis Kantor",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),

                          SizedBox(height: 2),

                          Text(
                            "Stok: 5",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.orange.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: const Text("Menipis"),
                    ),
                  ],
                ),
              ),

              /// ITEM 2
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(10),

                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(14),
                ),

                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.shade100,
                      ),
                      child: const Icon(Icons.book, size: 30),
                    ),

                    const SizedBox(width: 12),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Buku Tulis Sidu Isi 38",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),

                          Text(
                            "Alat Tulis Kantor",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),

                          SizedBox(height: 2),

                          Text(
                            "Stok: 5",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.orange.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: const Text("Menipis"),
                    ),
                  ],
                ),
              ),

              /// ITEM 3
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(10),

                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(14),
                ),

                child: Row(
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.shade100,
                      ),
                      child: const Icon(Icons.book, size: 30),
                    ),

                    const SizedBox(width: 12),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Buku Tulis Sidu Isi 38",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),

                          Text(
                            "Alat Tulis Kantor",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),

                          SizedBox(height: 2),

                          Text(
                            "Stok: 5",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.orange.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: const Text("Menipis"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// BUTTON EXPORT
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},

                      icon: const Icon(
                        Icons.picture_as_pdf,
                        color: Colors.black,
                      ),

                      label: const Text(
                        "Format PDF",
                        style: TextStyle(color: Colors.black),
                      ),

                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},

                      icon: const Icon(Icons.download, color: Colors.white),

                      label: const Text(
                        "Unduh CSV",
                        style: TextStyle(color: Colors.white),
                      ),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
