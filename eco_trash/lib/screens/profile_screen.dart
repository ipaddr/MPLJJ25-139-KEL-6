import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/profile_viewmodel.dart';
import '../widgets/profile_card.dart';
import '../models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProfileViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: Column(
          children: [
            ProfileCard(
                userModel: UserModel(
              username: vm.username,
              email: vm.email,
              phone: vm.phone,
              address: vm.address,
              role: vm.role,
            )),
            if (vm.error != null) ...[
              const SizedBox(height: 16),
              Text(vm.error!, style: const TextStyle(color: Colors.red)),
            ],
            ElevatedButton(
              onPressed: () {
                _showEditDialog(context);
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    final vm = context.read<ProfileViewModel>();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();

    phoneController.text = vm.phone;
    addressController.text = vm.address;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Profile'),
          content: Column(
            children: [
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
              ),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final newPhone = phoneController.text;
                final newAddress = addressController.text;
                vm.updateProfile(newPhone, newAddress);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
