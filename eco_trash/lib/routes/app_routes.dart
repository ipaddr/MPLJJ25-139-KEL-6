import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';
import '../screens/validation_screen.dart';
import '../screens/profile_screen.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          // Child routes (optional) bisa ditambahkan di sini
        ],
      ),
      GoRoute(
        path: '/validation',
        builder: (context, state) => const ValidationScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
  );
}
