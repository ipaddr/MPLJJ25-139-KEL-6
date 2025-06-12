import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewModel extends ChangeNotifier {
  String _username = '';
  String _role = '';
  double _totalSampah = 0.0;
  String? _error;
  bool _isLoading = false;

  String get username => _username;
  String get role => _role;
  double get totalSampah => _totalSampah;
  String? get error => _error;
  bool get isLoading => _isLoading;

  Future<void> fetchUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');

    if (token == null) {
      _error = "Token tidak ditemukan";
      notifyListeners();
      return;
    }

    try {
      _isLoading = true;
      notifyListeners();

      final response = await http.get(
        Uri.parse('http://192.168.246.56:8000/api/me/'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        _username = json['username'] ?? '';
        _role = (json['role'] ?? 'nasabah').toString().replaceFirstMapped(
            RegExp(r'^.'), (m) => m.group(0)!.toUpperCase());
        _error = null;
      } else {
        _error = "Gagal memuat profil";
      }
    } catch (e) {
      _error = "Gagal koneksi: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchTotalSampah() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');

    if (token == null) {
      _error = "Token tidak ditemukan";
      notifyListeners();
      return;
    }

    try {
      final response = await http.get(
        Uri.parse('http://192.168.246.56:8000/api/total-sampah/'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        _totalSampah = json['total_berat']?.toDouble() ?? 0.0;
        _error = null;
      } else {
        _error = "Gagal memuat total sampah";
      }
    } catch (e) {
      _error = "Kesalahan saat memuat data: $e";
    } finally {
      notifyListeners();
    }
  }
}
