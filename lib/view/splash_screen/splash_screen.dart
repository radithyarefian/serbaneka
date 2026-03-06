import 'package:flutter/material.dart';
import 'package:serbaneka/view/login/pelanggan_login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PelangganLogin()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// BACKGROUND IMAGE
          Positioned.fill(
            child: Image.asset(
              "assets/images/background_splashscreen.png",
              fit: BoxFit.cover,
            ),
          ),

          /// CONTENT
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/logo_serbaneka.png", width: 180),
                const SizedBox(height: 10),
                const Text(
                  "SERBANEKA",
                  style: TextStyle(
                    fontFamily: "ADLaMDisplay",
                    fontSize: 33,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
