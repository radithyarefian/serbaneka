import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  final items = <Widget>[
    SvgPicture.asset("assets/navbar/beranda.svg", width: 25, height: 25),
    SvgPicture.asset("assets/navbar/produk.svg", width: 25, height: 25),
    SvgPicture.asset("assets/navbar/laporan.svg", width: 25, height: 25),
    SvgPicture.asset("assets/navbar/profil.svg", width: 25, height: 25),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listWidget.elementAt(_currentIndex),
      bottomNavigationBar: Theme(
        data: Theme.of(
          context,
        ).copyWith(iconTheme: const IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          color: Color(0xFF7B6EF6),
          backgroundColor: Colors.transparent,
          height: 60,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 250),
          items: items,
          onTap: ontapItem,
        ),
      ),
    );
  }
}
