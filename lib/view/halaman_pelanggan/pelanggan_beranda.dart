import 'package:flutter/material.dart';
import 'tambah_produk_pelanggan.dart';

class PelangganBeranda extends StatefulWidget {
  const PelangganBeranda({super.key});

  @override
  State<PelangganBeranda> createState() => _Pelanggan_berandaState();
}

class _Pelanggan_berandaState extends State<PelangganBeranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// BACKGROUND
          Container(
            width: double.infinity,
            height: 450,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF32B2B2),
                  Color(0xFFFFFFFF),
                ],
              ),
            ),
          ),

          /// CONTENT SCROLL
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                children: [

                  /// DISKON BANNER
                  SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [

                        const SizedBox(width: 10),

                        Container(
                          width: 225,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/images/diskon1.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        Container(
                          width: 225,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/images/diskon1.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// KATEGORI
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Column(
                        children: [

                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Color(0xFF2FA7A4),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.sports_basketball,color: Colors.white),
                          ),

                          const SizedBox(height: 5),

                          const Text("Olahraga")
                        ],
                      ),

                      Column(
                        children: [

                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Color(0xFF2FA7A4),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.checkroom,color: Colors.white),
                          ),

                          const SizedBox(height: 5),

                          const Text("Seragam")
                        ],
                      ),

                      Column(
                        children: [

                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Color(0xFF2FA7A4),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.menu_book,color: Colors.white),
                          ),

                          const SizedBox(height: 5),

                          const Text("Buku Tulis")
                        ],
                      ),

                      Column(
                        children: [

                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Color(0xFF2FA7A4),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.electrical_services,color: Colors.white),
                          ),

                          const SizedBox(height: 5),

                          const Text("Alat Listrik")
                        ],
                      ),

                    ],
                  ),

                  const SizedBox(height: 25),

                  /// VIRAL CONTAINER
                  Container(
                    width: 370,
                    height: 165,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9E9E9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [

                        const SizedBox(height: 10),

                        const Row(
                          children: [

                            SizedBox(width: 10),

                            Icon(Icons.local_fire_department,color: Colors.orange),

                            SizedBox(width: 10),

                            Text(
                              "Sedang Viral",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),

                        const SizedBox(height: 10),

                        Container(
                          width: 340,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [

                              const SizedBox(width: 10),

                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    image: AssetImage("assets/images/buku_sidu.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 10),

                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text(
                                    "Trending",
                                    style: TextStyle(
                                      color: Color(0xFF2FA7A4),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  Text(
                                    "Buku Campus Big Boss",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                ],
                              )

                            ],
                          ),
                        )

                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// REKOMENDASI
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Rekomendasi Untukmu",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  /// PRODUK GRID
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Container(
                        width: 170,
                        height: 220,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          children: [

                            Column(
                              children: [

                                const SizedBox(height: 10),

                                Image.asset(
                                  "assets/images/buku_sidu.png",
                                  width: 90,
                                ),

                                const SizedBox(height: 5),

                                const Text("Buku Tulis"),
                                const Text("Big Boss Campus"),

                                const SizedBox(height: 5),

                                const Text(
                                  "30 terjual",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                const Text(
                                  "Rp 8.000",
                                  style: TextStyle(
                                    color: Color(0xFF2FA7A4),
                                    fontWeight: FontWeight.bold,
                                  ),
                                )

                              ],
                            ),

                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) {
                                      return const TambahProdukPelanggan();
                                    },
                                  );
                                },
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF32B2B2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )

                          ],
                        ),
                      ),

                      Container(
                        width: 170,
                        height: 220,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          children: [

                            Column(
                              children: [

                                const SizedBox(height: 10),

                                Image.asset(
                                  "assets/images/buku_sidu.png",
                                  width: 90,
                                ),

                                const SizedBox(height: 5),

                                const Text("Buku Tulis"),
                                const Text("Big Boss Campus"),

                                const SizedBox(height: 5),

                                const Text(
                                  "30 terjual",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                const Text(
                                  "Rp 8.000",
                                  style: TextStyle(
                                    color: Color(0xFF2FA7A4),
                                    fontWeight: FontWeight.bold,
                                  ),
                                )

                              ],
                            ),

                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) {
                                      return const TambahProdukPelanggan();
                                    },
                                  );
                                },
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF32B2B2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )

                          ],
                        ),
                      ),

                    ],
                  ),

                  const SizedBox(height: 90),

                ],
              ),
            ),
          ),

          /// SEARCH BAR (PALING ATAS)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    width: 290,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [

                        SizedBox(width: 10),

                        Icon(Icons.search, size: 18),

                        SizedBox(width: 5),

                        Text(
                          "Cari Sepatu, tas sekolah, alat listrik...",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        )

                      ],
                    ),
                  ),

                  const SizedBox(width: 10),

                  const Icon(Icons.shopping_cart_outlined),

                  const SizedBox(width: 10),

                  const Icon(Icons.chat_bubble_outline)

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}