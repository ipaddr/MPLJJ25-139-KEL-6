import 'package:flutter/material.dart';
import '../models/user_model.dart';

class ProfileCard extends StatelessWidget {
  final UserModel userModel;

  const ProfileCard({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/sample_profile.png'), // Placeholder image
              ),
              const SizedBox(height: 16),
              Text(userModel.username,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(userModel.email, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 8),
              Text('Phone: ${userModel.phone}',
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('Address: ${userModel.address}',
                  style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('Role: ${userModel.role}',
                  style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
