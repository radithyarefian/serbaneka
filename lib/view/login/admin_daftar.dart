import 'package:flutter/material.dart';

class AdminDaftar extends StatefulWidget {
  const AdminDaftar({super.key});

  @override
  State<AdminDaftar> createState() => _AdminDaftarState();
}

class _AdminDaftarState extends State<AdminDaftar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Gradient kiri atas ///
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(
                  -2,
                  -0.3,
                ), // dari sisi kiri, tidak sampai atas
                radius: 1.0,
                colors: [
                  const Color(0xFF7B6EF6).withOpacity(0.6),
                  Colors.transparent,
                ],
              ),
            ),
          ),

          /// Gradient kanan bawah ///
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.bottomRight,
                radius: 1.2,
                colors: [
                  const Color(0xFF7B6EF6).withOpacity(0.6),
                  const Color(0xFF7B6EF6).withOpacity(0.0),
                ],
              ),
            ),
          ),

          /// Konten UI nanti di sini ///
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),

                  /// Title
                  const Text(
                    "Buat Akun Baru",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// Subtitle
                  const Text(
                    "Lengkapi data diri Anda untuk melanjutkan",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
