import 'package:flutter/material.dart';
import 'package:serbaneka/database/preference.dart';
import 'package:serbaneka/extensions/navigator.dart';
import 'package:serbaneka/view/halaman_admin/admin_beranda.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailAdminController = TextEditingController();
  final TextEditingController passwordAdminController = TextEditingController();
  bool _isVisibility = false;
  bool _isRememberMe = false;
  bool emailAdminError = false;
  bool passwordAdminError = false;
  void _visibilityOnOf() {
    _isVisibility = !_isVisibility;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // BACKGROUND COLOR GRADASI //
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(-1.8, 0.3),
            radius: 1.3,
            colors: [Color(0xff7B6EF6), Colors.white],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                /// BAGIAN LOGO,JUDUL LOGO,DAN DESKRIPSI LOGO ///
                const SizedBox(height: 20),
                // LOGO SERBANEKA //
                Image.asset("assets/images/logo_serbaneka.png", height: 85),
                const SizedBox(height: 5),

                // JUDUL //
                const Text(
                  "SERBANEKA",
                  style: TextStyle(
                    fontFamily: "ADLaMDisplay",
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),

                // DESKRIPSI //
                const Text(
                  "Kebutuhan sekolah dan harian,kini lebih \npraktis dan mudah",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Color(0x80000000), // HITAM 50%
                  ),
                ),
                const SizedBox(height: 25),

                /// BAGIAN PELANGGAN DAN ADMIN ///
                Row(
                  children: [
                    // TEXT PELANGGAN (TIDAK AKTIF) //
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Pelanggan",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                              color: Color(0x80000000), // HITAM 50%
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 80),
                    // TEXT ADMIN (AKTIF) //
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Admin",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                            color: Color(0xFF7B6EF6), // warna ungu utama
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                /// BAGIAN KOTAK DAN JUDUL KOTAK ///
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // KOTAK UNGU //
                        Container(
                          width: 69,
                          height: 69,
                          decoration: BoxDecoration(
                            color: Color(0xFF7B6EF6),
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),

                        // ICON PROFIL //
                        Image.asset(
                          "assets/icons/login_profile.png",
                          width: 31,
                          height: 31,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // TEXT LOGIN PELANGGAN //
                    const Text(
                      "Login Pelanggan",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    // TEXT SUBTITLE //
                    const Text(
                      "Masukkan identitas admin anda",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color(0x80000000), // hitam 50%
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                /// BAGIAN IDENTITAS DAN KATA SANDI ///
                // AREA SCROLLING //
                Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 315),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // TEXT IDENTITAS //
                              const Text(
                                "Identitas",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 10),

                              // TEXTFORMFIELD EMAIL ATAU USERNAME ADMIN //
                              TextFormField(
                                controller: emailAdminController,
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: "Masukkan email atau username",
                                  hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontFamily: "Inter",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),

                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                      right: 6,
                                    ),
                                    child: Icon(
                                      Icons.email_outlined,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),

                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.2),

                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                    horizontal: 12,
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: const Color(0XFFE11D48),
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.5),
                                      width: 1,
                                    ),
                                  ),

                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.5),
                                      width: 1.5,
                                    ),
                                  ),
                                ),

                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Identitas tidak boleh kosong";
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 15),

                              // TEXT KATA SANDI//
                              const Text(
                                "Kata Sandi",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 10),

                              // TEXTFORMFIELD PASSWORD //
                              TextFormField(
                                controller: passwordAdminController,
                                obscureText: !_isVisibility,
                                style: const TextStyle(color: Colors.black),

                                decoration: InputDecoration(
                                  hintText: "Masukkan kata sandi",
                                  hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontFamily: "Inter",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),

                                  // ICON KIRI (PADLOCK)
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                      right: 6,
                                    ),
                                    child: Icon(
                                      Icons.lock_outline,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),

                                  // ICON KANAN (VISIBILITY)
                                  suffixIcon: IconButton(
                                    onPressed: _visibilityOnOf,
                                    icon: Icon(
                                      _isVisibility
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),

                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.2),

                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                    horizontal: 12,
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: const Color(0XFFE11D48),
                                      width: 1,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.5),
                                      width: 1,
                                    ),
                                  ),

                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.5),
                                      width: 1.5,
                                    ),
                                  ),
                                ),

                                // VALIDATOR KATA SANDI //
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Kata sandi tidak boleh kosong";
                                  }
                                  if (value.length < 6) {
                                    return "Kata sandi minimal 6 karakter";
                                  }

                                  // Regex untuk huruf besar
                                  if (!RegExp(r'[A-Z]').hasMatch(value)) {
                                    return "Kata sandi minimal 1 huruf besar";
                                  }

                                  // Regex untuk huruf kecil
                                  if (!RegExp(r'[a-z]').hasMatch(value)) {
                                    return "Kata sandi minimal 1 huruf kecil";
                                  }

                                  // Regex untuk angka
                                  if (!RegExp(r'\d').hasMatch(value)) {
                                    return "Kata sandi harus mengandung minimal 1 angka";
                                  }

                                  // Regex untuk karakter spesial
                                  if (!RegExp(
                                    r'[!@#$%^&*(),.?":{}|<>]',
                                  ).hasMatch(value)) {
                                    return "Kata sandi harus mengandung minimal 1 karakter spesial";
                                  }

                                  return null; // valid
                                },
                              ),

                              ///  BAGIAN INGAT SAYA DAN LUPA SANDI ///
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // CHECKBOX DAN TEXT "INGAT SAYA" //
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isRememberMe = !_isRememberMe;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              color: _isRememberMe
                                                  ? Color(0xFF7B6EF6)
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              border: Border.all(
                                                color: Colors.black.withOpacity(
                                                  0.5,
                                                ),
                                              ),
                                            ),
                                            child: _isRememberMe
                                                ? const Icon(
                                                    Icons.check,
                                                    size: 18,
                                                    color: Colors.white,
                                                  )
                                                : null,
                                          ),
                                          const SizedBox(width: 8),
                                          const Text(
                                            "Ingat saya",
                                            style: TextStyle(
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // TEXT "LUPA SANDI?" //
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Lupa sandi?",
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13,
                                          color: Color(
                                            0xFF7B6EF6,
                                          ), // warna ungu utama
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              /// TOMBOL MASUK SEKARANG ///
                              Center(
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxWidth: 315,
                                  ), // sama dengan TextFormField
                                  child: ElevatedButton(
                                    onPressed: () {
                                      PreferenceHandler().storingIsLogin(true);
                                      context.push(AdminBeranda());
                                      if (_formKey.currentState!.validate()) {
                                        // proses login
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(
                                        0xFF7B6EF6,
                                      ), // ungu utama
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 14,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text(
                                          "Masuk Sekarang",
                                          style: TextStyle(
                                            fontFamily: "Inter",
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              Column(
                                children: [
                                  // GARIS ATAU //
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Divider(
                                            color: Colors.black.withOpacity(
                                              0.2,
                                            ),
                                            thickness: 1,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          child: Text(
                                            "atau",
                                            style: TextStyle(
                                              fontFamily: "Inter",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Divider(
                                            color: Colors.black.withOpacity(
                                              0.2,
                                            ),
                                            thickness: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // BUTTON MASUK DENGAN GOOGLE //
                                  Center(
                                    child: ConstrainedBox(
                                      constraints: const BoxConstraints(
                                        maxWidth: 315,
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          var dataIsLogin =
                                              await PreferenceHandler.getIsLogin();
                                          print(dataIsLogin);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(
                                            0xFFE5E5E5,
                                          ), // abu-abu
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              15,
                                            ),
                                            side: BorderSide(
                                              color: Colors.black.withOpacity(
                                                0.2,
                                              ), // border hitam 20%
                                              width: 1,
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 14,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/icons/login_google.png",
                                              width: 20,
                                              height: 20,
                                            ),
                                            const SizedBox(width: 10),
                                            const Text(
                                              "Masuk dengan Google",
                                              style: TextStyle(
                                                fontFamily: "Inter",
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  // BAGIAN BELUM PUNYA AKUN //
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Belum punya akun? ",
                                          style: TextStyle(
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            // nanti bisa diisi aksi klik
                                          },
                                          style: TextButton.styleFrom(
                                            padding: EdgeInsets
                                                .zero, // biar tidak ada padding default
                                            minimumSize: Size(0, 0),
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap,
                                          ),
                                          child: const Text(
                                            "Daftar",
                                            style: TextStyle(
                                              fontFamily: "Inter",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: Color(
                                                0xFF7B6EF6,
                                              ), // ungu utama
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
