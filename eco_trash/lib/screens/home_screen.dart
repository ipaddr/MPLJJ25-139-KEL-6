import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_viewmodel.dart';
import '../widgets/header_bar.dart';
import '../widgets/info_card.dart';
import '../widgets/menu_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Column(
          children: [
            HeaderBar(username: vm.username, role: vm.role),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  InfoCard(totalSampah: vm.totalSampah),
                  const SizedBox(height: 24),
                  MenuButtons(
                    onInfoNasabah: () =>
                        _showSnack(context, "Navigasi ke info nasabah"),
                    onEditHarga: () =>
                        _showSnack(context, "Navigasi ke edit harga"),
                    onLaporanSampah: () =>
                        _showSnack(context, "Navigasi ke laporan sampah"),
                  ),
                  if (vm.error != null) ...[
                    const SizedBox(height: 16),
                    Text(vm.error!, style: const TextStyle(color: Colors.red)),
                  ],
                  if (vm.isLoading)
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
