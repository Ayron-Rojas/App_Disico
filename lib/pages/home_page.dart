import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:app_disico/widgets/side_menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar: Barra superior con el título.
      appBar: AppBar(
        title: const Text('Gestión EPP'),
      ),
      body: Row(
        children: [
          SideMenu(), // Tu menú lateral
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  // Mensaje de bienvenida.
                  const Text(
                    'Bienvenido a la Gestión EPP',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  // Tarjeta para Registro EPP.
                  Card(
                    elevation: 4,
                    child: ListTile(
                      leading: const Icon(Icons.add, color: Colors.blue),
                      title: const Text('Registrar nuevo EPP'),
                      onTap: () => context.go('/registro'), // go_router
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Tarjeta para Movimientos.
                  Card(
                    elevation: 4,
                    child: ListTile(
                      leading: const Icon(Icons.swap_horiz, color: Colors.green),
                      title: const Text('Gestionar Movimientos'),
                      onTap: () => context.go('/movimientos'), // go_router
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Tarjeta para Reportes.
                  Card(
                    elevation: 4,
                    child: ListTile(
                      leading: const Icon(Icons.bar_chart, color: Colors.orange),
                      title: const Text('Ver Reportes'),
                      onTap: () => context.go('/reportes'), // go_router
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
