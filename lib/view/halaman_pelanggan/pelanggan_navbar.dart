import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:serbaneka/view/halaman_pelanggan/pelanggan_beranda.dart';
import 'package:serbaneka/view/halaman_pelanggan/pelanggan_pesanan.dart';
import 'package:serbaneka/view/halaman_pelanggan/pelanggan_profil.dart';
import 'package:serbaneka/view/halaman_pelanggan/pelanggan_promo.dart';
import 'package:serbaneka/view/halaman_pelanggan/pelanggan_viral.dart';

class PelangganNavbar extends StatefulWidget {
  const PelangganNavbar({super.key});

  @override
  State<PelangganNavbar> createState() => _PelangganNavbarState();
}

class _PelangganNavbarState extends State<PelangganNavbar> {
  int _currentIndex = 0;

  Color activeColor = const Color(0xFF32B2B2);
  Color inactiveColor = Colors.black.withOpacity(0.7);

  void ontapItem(int index) {
    _currentIndex = index;
    setState(() {});
  }

  static List<Widget> listWidget = [
    PelangganBeranda(),
    PelangganViral(),
    PelangganPromo(),
    PelangganPesanan(),
    PelangganProfil(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,

      body: Stack(
        children: [
          /// HALAMAN
          listWidget.elementAt(_currentIndex),

          /// NAVBAR FLOATING
          Positioned(
            left: 12,
            right: 12,
            bottom: 5 + MediaQuery.of(context).padding.bottom,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: const Color(0xFFC8F0F0),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: GNav(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    gap: 3,
                    backgroundColor: const Color(0xFFC8F0F0),

                    color: inactiveColor,
                    activeColor: activeColor,

                    tabBackgroundColor: const Color(
                      0xFF32B2B2,
                    ).withOpacity(0.20),

                    selectedIndex: _currentIndex,
                    onTabChange: ontapItem,

                    tabs: [
                      GButton(
                        icon: Icons.circle,
                        leading: SvgPicture.asset(
                          "assets/navbar_pelanggan/beranda.svg",
                          width: 25,
                          height: 24,
                          color: _currentIndex == 0
                              ? activeColor
                              : inactiveColor,
                        ),
                        text: "Beranda",
                      ),
                      GButton(
                        icon: Icons.circle,
                        leading: SvgPicture.asset(
                          "assets/navbar_pelanggan/viral.svg",
                          width: 21,
                          height: 25,
                          color: _currentIndex == 1
                              ? activeColor
                              : inactiveColor,
                        ),
                        text: "Viral",
                      ),
                      GButton(
                        icon: Icons.circle,
                        leading: SvgPicture.asset(
                          "assets/navbar_pelanggan/promo.svg",
                          width: 25,
                          height: 23,
                          color: _currentIndex == 2
                              ? activeColor
                              : inactiveColor,
                        ),
                        text: "Promo",
                      ),
                      GButton(
                        icon: Icons.circle,
                        leading: SvgPicture.asset(
                          "assets/navbar_pelanggan/pesanan.svg",
                          width: 23,
                          height: 25,
                          color: _currentIndex == 3
                              ? activeColor
                              : inactiveColor,
                        ),
                        text: "Pesanan",
                      ),
                      GButton(
                        icon: Icons.circle,
                        leading: SvgPicture.asset(
                          "assets/navbar_pelanggan/profil.svg",
                          width: 23,
                          height: 25,
                          color: _currentIndex == 4
                              ? activeColor
                              : inactiveColor,
                        ),
                        text: "Profil",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
