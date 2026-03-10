import 'package:flutter/material.dart';
import 'package:serbaneka/view/halaman_admin/admin_beranda.dart';
import 'package:serbaneka/view/halaman_admin/admin_laporan.dart';
import 'package:serbaneka/view/halaman_admin/admin_produk.dart';
import 'package:serbaneka/view/halaman_admin/admin_profile.dart';

class AdminNavbar extends StatefulWidget {
  const AdminNavbar({super.key});

  @override
  State<AdminNavbar> createState() => _AdminNavbarState();
}

class _AdminNavbarState extends State<AdminNavbar> {
  int _currentIndex = 0;
  void ontapItem(int index) {
    _currentIndex = index;
    setState(() {});
  }

  static List<Widget> listWidget = [
    AdminBeranda(),
    AdminProduk(),
    AdminLaporan(),
    AdminProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listWidget.elementAt(_currentIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black.withOpacity(0.2), // hitam 20%
              width: 1.5,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: ontapItem,

          selectedItemColor: const Color(0xFF7B6EF6), // ungu aktif
          unselectedItemColor: Colors.black.withOpacity(0.5), // hitam 50%

          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),

          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),

          type: BottomNavigationBarType.fixed,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "beranda",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              label: "produk",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.task), label: "laporan"),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: "profil",
            ),
          ],
        ),
      ),
    );
  }
}
