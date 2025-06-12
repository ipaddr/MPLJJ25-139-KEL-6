import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  bool _isLoading = false;

  Future<void> _register() async {
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final phone = _phoneController.text.trim();
    final address = _addressController.text.trim();

    if ([username, email, password, phone, address].any((e) => e.isEmpty)) {
      _showToast("Semua field wajib diisi");
      return;
    }

    final role = 'nasabah'; // default fallback jika bukan "bank"
    setState(() => _isLoading = true);

    try {
      final response = await http.post(
        Uri.parse('http://192.168.246.56:8000/api/register/'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'email': email,
          'password': password,
          'no_hp': phone,
          'alamat': address,
          'role': role,
        }),
      );

      if (response.statusCode == 200) {
        _showToast("Registrasi berhasil");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      } else {
        _showToast("Registrasi gagal: ${response.body}");
      }
    } catch (e) {
      _showToast("Kesalahan: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showToast(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Widget _buildTextField(String label, String hint,
      TextEditingController controller, TextInputType type,
      {bool obscure = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hint, border: const OutlineInputBorder()),
          keyboardType: type,
          obscureText: obscure,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/top_background.png',
                    width: double.infinity, height: 200, fit: BoxFit.cover),
                const Positioned(
                  top: 60,
                  left: 24,
                  child: Text(
                    'Create\nAccount',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
              child: Column(
                children: [
                  _buildTextField("Username", "Enter your username",
                      _usernameController, TextInputType.name),
                  _buildTextField("Email", "Enter your email", _emailController,
                      TextInputType.emailAddress),
                  _buildTextField("Password", "Enter your password",
                      _passwordController, TextInputType.visiblePassword,
                      obscure: true),
                  _buildTextField("No Handphone", "Enter your phone number",
                      _phoneController, TextInputType.phone),
                  _buildTextField("Address", "Enter your address",
                      _addressController, TextInputType.streetAddress),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: _register,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                            backgroundColor: Colors.green,
                          ),
                          child: const Text("DAFTAR",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
