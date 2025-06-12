import 'package:flutter/material.dart';
import 'routes/app_routes.dart'; // Import router configuration

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.router, // Sambungkan dengan konfigurasi GoRouter
      title: 'Eco Trash Bank',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
