import 'package:flutter/material.dart';
import 'package:serbaneka/database/preference.dart';
import 'package:serbaneka/view/halaman_admin/admin_navbar.dart';
import 'package:serbaneka/view/login/pelanggan_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceHandler().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// FUNCTION CEK LOGIN
  Future<bool> checkLogin() async {
    bool? isLogin =
        await PreferenceHandler.getIsLogin();

    return isLogin ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 68, 54, 92),
        ),
      ),

      /// CEK LOGIN SAAT APP DIBUKA
      home: FutureBuilder<bool>(
        future: checkLogin(),
        builder: (context, snapshot) {

          /// LOADING
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          /// JIKA SUDAH LOGIN
          if (snapshot.data == true) {
            return const AdminNavbar();
          }

          /// JIKA BELUM LOGIN
          return const PelangganLogin();
        },
      ),
    );
  }
}