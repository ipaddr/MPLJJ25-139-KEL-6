import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/setoran_model.dart';

class ValidationViewModel extends ChangeNotifier {
  String username = '';
  String role = '';
  String? error;
  List<SetoranModel> setoranList = [];

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
      role = data['role'] ?? '';
      error = null;
    } else {
      error = "Gagal memuat profil";
    }
    notifyListeners();
  }

  Future<void> fetchSetoran() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    if (token == null) return;

    final res = await http.get(
      Uri.parse("http://192.168.246.56:8000/api/validasi-setor/"),
      headers: {"Authorization": "Bearer $token"},
    );

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body) as List;
      setoranList = data.map((json) => SetoranModel.fromJson(json)).toList();
      error = null;
    } else {
      error = "Gagal memuat setoran";
    }
    notifyListeners();
  }

  Future<void> validasiSetoran(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    final url = "http://192.168.246.56:8000/api/validasi-setor/$id/";
    final res = await http.post(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
    });

    if (res.statusCode == 200) {
      await fetchSetoran();
    } else {
      error = "Gagal validasi setoran";
      notifyListeners();
    }
  }

  Future<void> transferPoin(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    final url = "http://192.168.246.56:8000/api/transfer-saldo/$id/";
    final res = await http.post(Uri.parse(url), headers: {
      "Authorization": "Bearer $token",
    });

    if (res.statusCode == 200) {
      await fetchSetoran();
    } else {
      error = "Gagal transfer poin";
      notifyListeners();
    }
  }
}
