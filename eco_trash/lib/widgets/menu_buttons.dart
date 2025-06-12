import 'package:flutter/material.dart';

class MenuButtons extends StatelessWidget {
  final VoidCallback onLaporanSampah;
  final VoidCallback onEditHarga;
  final VoidCallback onInfoNasabah;

  const MenuButtons({
    super.key,
    required this.onLaporanSampah,
    required this.onEditHarga,
    required this.onInfoNasabah,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildCard("Laporan Sampah", Icons.add_chart, onLaporanSampah),
            _buildCard("Edit Harga", Icons.price_change, onEditHarga),
          ],
        ),
        const SizedBox(height: 12),
        Center(
          child: SizedBox(
            width: 180,
            child:
                _buildCard("Info Nasabah", Icons.info_outline, onInfoNasabah),
          ),
        )
      ],
    );
  }

  Widget _buildCard(String label, IconData icon, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: SizedBox(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 36),
                const SizedBox(height: 8),
                Text(label, textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
