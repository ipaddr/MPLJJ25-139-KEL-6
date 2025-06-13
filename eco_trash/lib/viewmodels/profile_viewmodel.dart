import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class ProfileViewModel extends ChangeNotifier {
  String username = '';
  String email = '';
  String phone = '';
  String address = '';
  String role = '';
  String? error;

  Future<void> fetchUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    if (token == null) {
      error = "Token tidak ditemukan";
      notifyListeners();
      return;
    }

    final res = await http.get(
      Uri.parse("http://192.168.246.56:8000/api/me/"),
      headers: {"Authorization": "Bearer $token"},
    );

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      username = data['username'] ?? '';
      email = data['email'] ?? '';
      phone = data['no_hp'] ?? '';
      address = data['alamat'] ?? '';
      role = data['role'] ?? '';
      error = null;
    } else {
      error = "Gagal memuat profil";
    }
    notifyListeners();
  }

  Future<void> updateProfile(String phone, String address) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    final url = "http://192.168.246.56:8000/api/profile/";

    final json = jsonEncode({
      'no_hp': phone,
      'alamat': address,
    });

    final res = await http.put(
      Uri.parse(url),
      body: json,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
      },
    );

    if (res.statusCode == 200) {
      await fetchUserProfile();
      error = "Profil berhasil diperbarui";
    } else {
      error = "Gagal memperbarui profil";
    }
    notifyListeners();
  }
}
