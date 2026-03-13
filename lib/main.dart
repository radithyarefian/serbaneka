import 'package:flutter/material.dart';
import 'package:serbaneka/database/preference.dart';
import 'package:serbaneka/view/halaman_admin/admin_beranda.dart';
import 'package:serbaneka/view/halaman_admin/admin_navbar.dart';
import 'package:serbaneka/view/login/admin_login.dart';
import 'package:serbaneka/view/login/pelanggan_login.dart';
import 'package:serbaneka/view/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceHandler().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'admin',
      routes: {
        '/admin': (context) => AdminLogin(),
        '/pelanggan': (context) => PelangganLogin(),
      },
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
