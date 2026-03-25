import 'package:flutter/material.dart';
import 'package:serbaneka/database/sqflite.dart';
import 'package:serbaneka/model/pelanggan_model.dart';
import 'package:serbaneka/view/halaman_pelanggan/pelanggan_navbar.dart';
import 'package:serbaneka/view/login/pelanggan_login.dart';

class PelangganDaftar extends StatefulWidget {
  const PelangganDaftar({super.key});

  @override
  State<PelangganDaftar> createState() => _PelangganDaftarState();
}

class _PelangganDaftarState extends State<PelangganDaftar> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailPelangganDaftarController =
      TextEditingController();
  final TextEditingController passwordPelangganDaftar1Controller =
      TextEditingController();
  final TextEditingController passwordPelangganDaftar2Controller =
      TextEditingController();
  final TextEditingController namaDepanPelangganDaftarController =
      TextEditingController();
  final TextEditingController namaBelakangPelangganDaftarController =
      TextEditingController();
  bool _checkboxError = false;
  bool namaDepanPelangganError = false;
  bool namaBelakangPelangganError = false;
  bool alamatEmailPelangganError = false;
  bool password1PelangganError = false;
  bool password2PelangganError = false;
  bool _isRememberMe = false;

  bool _isVisibility1 = false;
  void _visibilityOnOf1() {
    _isVisibility1 = !_isVisibility1;
    setState(() {});
  }

  bool _isVisibility2 = false;
  void _visibilityOnOf2() {
    _isVisibility2 = !_isVisibility2;
    setState(() {});
  }

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
                radius: 2.0,
                colors: [
                  const Color(0xFF32B2B2).withOpacity(0.5),
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
                  const Color(0xFF32B2B2).withOpacity(0.6),
                  const Color(0xFF32B2B2).withOpacity(0.0),
                ],
              ),
            ),
          ),

          /// KONTEN UI ///
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),

                  // JUDUL TEKS //
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          "Buat Akun Baru",
                          style: TextStyle(
                            fontFamily: "ADLaMDisplay",
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),

                        // Subtitle //
                        const Text(
                          "Lengkapi data diri Anda untuk melanjutkan",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Color(0x80000000), // HITAM 50%
                          ),
                        ),
                        const SizedBox(height: 30),

                        /// AREA SCROLLING ///

                        // KOTAK INPUT DATA DIRI  //
                        Container(
                          width: 330,
                          height: 500,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: const Color(0xFF000000).withOpacity(0.1),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 25,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Form(
                            key: _formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // TEKS NAMA DEPAN //
                                  const Text(
                                    "Nama Depan",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  // BOX NAMA DEPAN //
                                  SizedBox(
                                    width: 300,
                                    child: TextFormField(
                                      controller:
                                          namaDepanPelangganDaftarController,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),

                                      decoration: InputDecoration(
                                        hintText: "Masukkan Nama Depan Anda",
                                        hintStyle: const TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),

                                        prefixIcon: const Padding(
                                          padding: EdgeInsets.only(
                                            left: 15,
                                            right: 6,
                                          ),
                                          child: Icon(Icons.person_outline),
                                        ),

                                        filled: true,
                                        fillColor: const Color(
                                          0xFFFFFFFF,
                                        ).withOpacity(0.2),

                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              vertical: 14,
                                              horizontal: 12,
                                            ),

                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          borderSide: const BorderSide(
                                            color: Color(0XFFE11D48),
                                            width: 1,
                                          ),
                                        ),

                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          borderSide: BorderSide(
                                            color: const Color(
                                              0xFF000000,
                                            ).withOpacity(0.3),
                                            width: 1,
                                          ),
                                        ),

                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          borderSide: BorderSide(
                                            color: const Color(
                                              0xFF000000,
                                            ).withOpacity(0.3),
                                            width: 1.5,
                                          ),
                                        ),
                                      ),

                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Nama Depan harus Diisi";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  // TEKS NAMA BELAKANG //
                                  const Text(
                                    "Nama Belakang",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  // BOX NAMA BELAKANG //
                                  SizedBox(
                                    width: 300,
                                    child: TextFormField(
                                      controller:
                                          namaBelakangPelangganDaftarController,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),

                                      decoration: InputDecoration(
                                        hintText: "Masukkan Nama Belakang Anda",
                                        hintStyle: const TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),

                                        prefixIcon: const Padding(
                                          padding: EdgeInsets.only(
                                            left: 15,
                                            right: 6,
                                          ),
                                          child: Icon(Icons.person_outline),
                                        ),

                                        filled: true,
                                        fillColor: const Color(
                                          0xFFFFFFFF,
                                        ).withOpacity(0.2),

                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              vertical: 14,
                                              horizontal: 12,
                                            ),

                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          borderSide: const BorderSide(
                                            color: Color(0XFFE11D48),
                                            width: 1,
                                          ),
                                        ),

                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          borderSide: BorderSide(
                                            color: const Color(
                                              0xFF000000,
                                            ).withOpacity(0.3),
                                            width: 1,
                                          ),
                                        ),

                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          borderSide: BorderSide(
                                            color: const Color(
                                              0xFF000000,
                                            ).withOpacity(0.3),
                                            width: 1.5,
                                          ),
                                        ),
                                      ),

                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Nama Belakang harus Diisi";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  // TEKS ALAMAT EMAIL //
                                  const Text(
                                    "Alamat Email",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  // BOX ALAMAT EMAIL //
                                  SizedBox(
                                    width: 300,
                                    child: TextFormField(
                                      controller:
                                          emailPelangganDaftarController,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),

                                      decoration: InputDecoration(
                                        hintText: "Contoh@gmail.com",
                                        hintStyle: const TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),

                                        prefixIcon: const Padding(
                                          padding: EdgeInsets.only(
                                            left: 15,
                                            right: 6,
                                          ),
                                          child: Icon(Icons.person_outline),
                                        ),

                                        filled: true,
                                        fillColor: const Color(
                                          0xFFFFFFFF,
                                        ).withOpacity(0.2),

                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              vertical: 14,
                                              horizontal: 12,
                                            ),

                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          borderSide: const BorderSide(
                                            color: Color(0XFFE11D48),
                                            width: 1,
                                          ),
                                        ),

                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          borderSide: BorderSide(
                                            color: const Color(
                                              0xFF000000,
                                            ).withOpacity(0.3),
                                            width: 1,
                                          ),
                                        ),

                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          borderSide: BorderSide(
                                            color: const Color(
                                              0xFF000000,
                                            ).withOpacity(0.3),
                                            width: 1.5,
                                          ),
                                        ),
                                      ),

                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Alamat Email harus Diisi";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  // TEKS KATA SANDI //
                                  const Text(
                                    "Kata Sandi",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  // BOX KATA SANDI //
                                  SizedBox(
                                    width: 300,
                                    child: TextFormField(
                                      controller:
                                          passwordPelangganDaftar1Controller,
                                      obscureText: !_isVisibility1,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),

                                      decoration: InputDecoration(
                                        hintText: "Masukkan kata sandi",
                                        hintStyle: const TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),

                                        /// ICON KIRI
                                        prefixIcon: const Padding(
                                          padding: EdgeInsets.only(
                                            left: 15,
                                            right: 6,
                                          ),
                                          child: Icon(Icons.lock_outline),
                                        ),

                                        /// ICON MATA
                                        suffixIcon: IconButton(
                                          onPressed: _visibilityOnOf1,
                                          icon: Icon(
                                            _isVisibility1
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          ),
                                        ),

                                        /// BACKGROUND
                                        filled: true,
                                        fillColor: const Color(
                                          0xFFFFFFFF,
                                        ).withOpacity(0.2),

                                        /// PADDING
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              vertical: 14,
                                              horizontal: 12,
                                            ),

                                        /// BORDER ERROR
                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          borderSide: const BorderSide(
                                            color: Color(0XFFE11D48),
                                            width: 1,
                                          ),
                                        ),

                                        /// BORDER NORMAL
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          borderSide: BorderSide(
                                            color: const Color(
                                              0xFF000000,
                                            ).withOpacity(0.3),
                                            width: 1,
                                          ),
                                        ),

                                        /// BORDER FOCUS
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          borderSide: BorderSide(
                                            color: const Color(
                                              0xFF000000,
                                            ).withOpacity(0.3),
                                            width: 1.5,
                                          ),
                                        ),
                                      ),

                                      /// VALIDATOR KATA SANDI
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Kata sandi tidak boleh kosong";
                                        }

                                        if (value.length < 6) {
                                          return "Kata sandi minimal 6 karakter";
                                        }

                                        if (!RegExp(r'[A-Z]').hasMatch(value)) {
                                          return "Kata sandi minimal 1 huruf besar";
                                        }

                                        if (!RegExp(r'[a-z]').hasMatch(value)) {
                                          return "Kata sandi minimal 1 huruf kecil";
                                        }

                                        if (!RegExp(r'\d').hasMatch(value)) {
                                          return "Kata sandi harus mengandung minimal 1 angka";
                                        }

                                        if (!RegExp(
                                          r'[!@#$%^&*(),.?":{}|<>]',
                                        ).hasMatch(value)) {
                                          return "Kata sandi harus mengandung minimal 1 karakter spesial";
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  // TEKS KONFIRMASI KATA SANDI //
                                  const Text(
                                    "Konfirmasi Kata Sandi",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  // BOX KONFIRMASI KATA SANDI //
                                  SizedBox(
                                    width: 300,
                                    child: TextFormField(
                                      controller:
                                          passwordPelangganDaftar2Controller,
                                      obscureText: !_isVisibility2,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),

                                      decoration: InputDecoration(
                                        hintText: "Ulangi Kata Sandi Anda",
                                        hintStyle: const TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),

                                        /// ICON KIRI
                                        prefixIcon: const Padding(
                                          padding: EdgeInsets.only(
                                            left: 15,
                                            right: 6,
                                          ),
                                          child: Icon(Icons.lock_outline),
                                        ),

                                        /// ICON MATA
                                        suffixIcon: IconButton(
                                          onPressed: _visibilityOnOf2,
                                          icon: Icon(
                                            _isVisibility2
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          ),
                                        ),

                                        /// BACKGROUND
                                        filled: true,
                                        fillColor: const Color(
                                          0xFFFFFFFF,
                                        ).withOpacity(0.2),

                                        /// PADDING
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              vertical: 14,
                                              horizontal: 12,
                                            ),

                                        /// BORDER ERROR
                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          borderSide: const BorderSide(
                                            color: Color(0XFFE11D48),
                                            width: 1,
                                          ),
                                        ),

                                        /// BORDER NORMAL
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          borderSide: BorderSide(
                                            color: const Color(
                                              0xFF000000,
                                            ).withOpacity(0.3),
                                            width: 1,
                                          ),
                                        ),

                                        /// BORDER FOCUS
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          borderSide: BorderSide(
                                            color: const Color(
                                              0xFF000000,
                                            ).withOpacity(0.3),
                                            width: 1.5,
                                          ),
                                        ),
                                      ),

                                      /// VALIDATOR KONFIRMASI PASSWORD
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Konfirmasi kata sandi tidak boleh kosong";
                                        }

                                        if (value !=
                                            passwordPelangganDaftar1Controller
                                                .text) {
                                          return "Konfirmasi kata sandi tidak sama";
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 30),

                                  // CHECKBOX PERSETUJUAN //
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Transform.translate(
                                        offset: const Offset(0, -11),
                                        child: Checkbox(
                                          value: _isRememberMe,
                                          onChanged: (value) {
                                            setState(() {
                                              _isRememberMe = value!;
                                              _checkboxError = false;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 1),
                                      Expanded(
                                        child: RichText(
                                          text: const TextSpan(
                                            style: TextStyle(
                                              fontFamily: "Inter",
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: "Saya menyetujui ",
                                              ),
                                              TextSpan(
                                                text: "Syarat & Ketentuan",
                                                style: TextStyle(
                                                  color: Color(0xFF32B2B2),
                                                ),
                                              ),
                                              TextSpan(text: " serta "),
                                              TextSpan(
                                                text: "Kebijakan Privasi",
                                                style: TextStyle(
                                                  color: Color(0xFF32B2B2),
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    " yang berlaku di Serbaneka",
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  /// ERROR CHECKBOX
                                  if (_checkboxError)
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        left: 20,
                                        top: 10,
                                      ),
                                      child: Text(
                                        "Anda harus menyetujui Syarat & Ketentuan",
                                        style: TextStyle(
                                          color: Color(0XFFE11D48),
                                          fontSize: 12,
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),

                                  const SizedBox(height: 30),

                                  /// ELEVATED BUTTON DAFTAR ///
                                  SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _checkboxError = !_isRememberMe;
                                        });

                                        if (_formKey.currentState!.validate() &&
                                            _isRememberMe) {
                                          DBHelper.registerPelanggan(
                                            PelangganModel(
                                              email:
                                                  emailPelangganDaftarController
                                                      .text,
                                              password:
                                                  passwordPelangganDaftar1Controller
                                                      .text,
                                            ),
                                          );

                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                "Pendaftaran admin berhasil",
                                                style: TextStyle(
                                                  fontFamily: "Inter",
                                                ),
                                              ),
                                              duration: Duration(seconds: 2),
                                            ),
                                          );

                                          Future.delayed(
                                            const Duration(seconds: 2),
                                            () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PelangganNavbar(),
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(
                                          0xFF32B2B2,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                        ),
                                        elevation: 0,
                                      ),
                                      child: const Text(
                                        "Daftar →",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFFFFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),

                        /// TEXT BUTTON ///
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PelangganLogin(),
                                ),
                              );
                            },
                            child: RichText(
                              text: const TextSpan(
                                text: 'Sudah punya akun? ',
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Masuk Sekarang',
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF32B2B2),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
