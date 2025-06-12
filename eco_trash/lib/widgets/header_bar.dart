import 'package:flutter/material.dart';

class HeaderBar extends StatelessWidget {
  final String username;
  final String role;

  const HeaderBar({super.key, required this.username, required this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: const EdgeInsets.all(12),
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(username,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              Text('• $role',
                  style: const TextStyle(color: Colors.white, fontSize: 14)),
            ],
          ),
          Row(
            children: [
              const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.green)),
              const SizedBox(width: 8),
              Stack(
                children: const [
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.notifications, color: Colors.green)),
                  Positioned(
                      top: 4,
                      right: 4,
                      child:
                          CircleAvatar(radius: 4, backgroundColor: Colors.red)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
