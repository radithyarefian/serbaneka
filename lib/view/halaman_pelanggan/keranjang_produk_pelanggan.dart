import 'package:flutter/material.dart';

class KeranjangProdukPelanggan extends StatefulWidget {
  const KeranjangProdukPelanggan({super.key});

  @override
  State<KeranjangProdukPelanggan> createState() => _KeranjangProdukPelangganState();
}

class _KeranjangProdukPelangganState extends State<KeranjangProdukPelanggan> {
  List<bool> selected = [false, false, false];
  List<int> qty = [1, 1, 1];

  int harga = 37000;

  int get total {
    int sum = 0;
    for (int i = 0; i < selected.length; i++) {
      if (selected[i]) {
        sum += qty[i] * harga;
      }
    }
    return sum;
  }

  int get totalItem {
    int count = 0;
    for (int i = 0; i < selected.length; i++) {
      if (selected[i]) count++;
    }
    return count;
  }

  bool get semuaDipilih => selected.every((e) => e);

  void pilihSemua(bool value) {
    setState(() {
      for (int i = 0; i < selected.length; i++) {
        selected[i] = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text(
          "Keranjang Saya",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.chat_bubble_outline, color: Colors.black),
          )
        ],
      ),

      body: Stack(
        children: [

          /// LIST PRODUK
          ListView.builder(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 120),
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 18),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [

                    /// CHECKBOX
                    Checkbox(
                      value: selected[index],
                      onChanged: (val) {
                        setState(() {
                          selected[index] = val!;
                        });
                      },
                    ),

                    /// GAMBAR PRODUK
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    const SizedBox(width: 12),

                    /// INFO PRODUK
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const Text(
                            "Buku Kampus",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              /// HARGA
                              const Text(
                                "Rp 37.000",
                                style: TextStyle(
                                  color: Color(0xFF2CA6A4),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),

                              /// QUANTITY
                              Row(
                                children: [

                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (qty[index] > 1) {
                                          qty[index]--;
                                        }
                                      });
                                    },
                                    child: const Text(
                                      "-",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),

                                  Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 8),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(qty[index].toString()),
                                  ),

                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        qty[index]++;
                                      });
                                    },
                                    child: const Text(
                                      "+",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),

          /// BOTTOM CHECKOUT BAR
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [

                  /// CHECKBOX SEMUA
                  Checkbox(
                    value: semuaDipilih,
                    onChanged: (val) {
                      pilihSemua(val!);
                    },
                  ),

                  const Text(
                    "Semua",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),

                  const Spacer(),

                  /// TOTAL HARGA
                  Text(
                    "Rp ${total.toString()}",
                    style: const TextStyle(
                      color: Color(0xFF2CA6A4),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(width: 10),

                  /// BUTTON CHECKOUT
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Checkout ($totalItem)",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}