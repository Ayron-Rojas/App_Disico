import 'package:app_disico/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class RegistroEPPPage extends StatelessWidget {
  const RegistroEPPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro EPP'),
      ),
      body: Row(
        children: [
          SideMenu(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                const Text('Pantalla de registro'),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
