import 'package:app_disico/widgets/main_layout.dart';
import 'package:flutter/material.dart';

class ReportesPage extends StatelessWidget {
  const ReportesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const Text('Pantalla de reportes'),
        ],
      ),
    ));
  }
}
