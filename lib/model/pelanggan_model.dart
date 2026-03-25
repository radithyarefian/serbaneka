import 'dart:convert';

class PelangganModel {
  final int? id;
  final String? email;
  final String? password;
  PelangganModel({
    this.id,
    this.email,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
    };
  }

  factory PelangganModel.fromMap(Map<String, dynamic> map) {
    return PelangganModel(
      id: map['id']?.toInt(),
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PelangganModel.fromJson(String source) => PelangganModel.fromMap(json.decode(source));
}
