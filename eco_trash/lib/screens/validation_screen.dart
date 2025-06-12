import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/validation_viewmodel.dart';
import '../widgets/setoran_card.dart';

class ValidationScreen extends StatefulWidget {
  const ValidationScreen({super.key});

  @override
  State<ValidationScreen> createState() => _ValidationScreenState();
}

class _ValidationScreenState extends State<ValidationScreen> {
  @override
  void initState() {
    super.initState();
    final vm = context.read<ValidationViewModel>();
    vm.fetchUserProfile();
    vm.fetchSetoran();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ValidationViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.green,
              height: 75,
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(vm.username,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      Text("• ${vm.role}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14)),
                    ],
                  ),
                  Row(
                    children: const [
                      CircleAvatar(child: Icon(Icons.person)),
                      SizedBox(width: 8),
                      Stack(
                        children: [
                          CircleAvatar(child: Icon(Icons.notifications)),
                          Positioned(
                              top: 2,
                              right: 2,
                              child: CircleAvatar(
                                  radius: 4, backgroundColor: Colors.red)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            if (vm.error != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    Text(vm.error!, style: const TextStyle(color: Colors.red)),
              ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: vm.setoranList.length,
                itemBuilder: (_, i) {
                  final setoran = vm.setoranList[i];
                  return SetoranCard(
                    setoran: setoran,
                    onValidasi: () => vm.validasiSetoran(setoran.id),
                    onTransfer: () => vm.transferPoin(setoran.id),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
