import 'package:flutter/material.dart';
import '../models/setoran_model.dart';

class SetoranCard extends StatelessWidget {
  final SetoranModel setoran;
  final VoidCallback onValidasi;
  final VoidCallback onTransfer;

  const SetoranCard({
    super.key,
    required this.setoran,
    required this.onValidasi,
    required this.onTransfer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(setoran.namaNasabah,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text("Jumlah Sampah: ${setoran.jumlahSampah} kg"),
            Text("Kategori: ${setoran.kategori}"),
            Text("Poin: ${setoran.poin}"),
            Row(
              children: [
                ElevatedButton(
                    onPressed: onValidasi, child: const Text("Validasi")),
                const SizedBox(width: 16),
                OutlinedButton(
                    onPressed: onTransfer, child: const Text("Transfer")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
