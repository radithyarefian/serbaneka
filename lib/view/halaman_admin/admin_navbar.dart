import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:serbaneka/view/halaman_admin/admin_beranda.dart';
import 'package:serbaneka/view/halaman_admin/admin_laporan.dart';
import 'package:serbaneka/view/halaman_admin/admin_pesan.dart';
import 'package:serbaneka/view/halaman_admin/admin_produk.dart';
import 'package:serbaneka/view/halaman_admin/admin_profile.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdminNavbar extends StatefulWidget {
  const AdminNavbar({super.key});

  @override
  State<AdminNavbar> createState() => _AdminNavbarState();
}

class _AdminNavbarState extends State<AdminNavbar> {
  int _currentIndex = 0;

  Color activeColor = const Color(0xFF7B6EF6);
  Color inactiveColor = Colors.black.withOpacity(0.7);

  void ontapItem(int index) {
    _currentIndex = index;
    setState(() {});
  }

  static List<Widget> listWidget = [
    AdminBeranda(),
    AdminProduk(),
    AdminPesan(),
    AdminLaporan(),
    AdminProfile(),
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
                color: const Color(0xFFE3E0FD),
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
                    backgroundColor: const Color(0xFFE3E0FD),

                    color: inactiveColor,
                    activeColor: activeColor,

                    tabBackgroundColor: const Color(
                      0xFF7B6EF6,
                    ).withOpacity(0.20),

                    selectedIndex: _currentIndex,
                    onTabChange: ontapItem,

                    tabs: [
                      GButton(
                        icon: Icons.circle,
                        leading: SvgPicture.asset(
                          "assets/navbar_admin/beranda.svg",
                          width: 24,
                          height: 25,
                          color: _currentIndex == 0
                              ? activeColor
                              : inactiveColor,
                        ),
                        text: "Beranda",
                      ),
                      GButton(
                        icon: Icons.circle,
                        leading: SvgPicture.asset(
                          "assets/navbar_admin/produk.svg",
                          width: 25,
                          height: 25,
                          color: _currentIndex == 1
                              ? activeColor
                              : inactiveColor,
                        ),
                        text: "Produk",
                      ),
                      GButton(
                        icon: Icons.circle,
                        leading: SvgPicture.asset(
                          "assets/navbar_admin/pesan.svg",
                          width: 25,
                          height: 25,
                          color: _currentIndex == 2
                              ? activeColor
                              : inactiveColor,
                        ),
                        text: "Pesan",
                      ),
                      GButton(
                        icon: Icons.circle,
                        leading: SvgPicture.asset(
                          "assets/navbar_admin/laporan.svg",
                          width: 21,
                          height: 25,
                          color: _currentIndex == 3
                              ? activeColor
                              : inactiveColor,
                        ),
                        text: "Laporan",
                      ),
                      GButton(
                        icon: Icons.circle,
                        leading: SvgPicture.asset(
                          "assets/navbar_admin/profil.svg",
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
