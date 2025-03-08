import 'package:app_disico/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar: Barra superior con el título.
      appBar: AppBar(
        title: Text('Gestión EPP'),
      ),
      body: Row(children: [
        const SideMenu(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                // Mensaje de bienvenida.
                Text(
                  'Bienvenido a la Gestión EPP',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                // Tarjeta para Registro EPP.
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.add, color: Colors.blue),
                    title: Text('Registrar nuevo EPP'),
                    onTap: () => Navigator.pushNamed(context, '/registro'),
                  ),
                ),
                SizedBox(height: 16),
                // Tarjeta para Movimientos.
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.swap_horiz, color: Colors.green),
                    title: Text('Gestionar Movimientos'),
                    onTap: () => Navigator.pushNamed(context, '/movimientos'),
                  ),
                ),
                SizedBox(height: 16),
                // Tarjeta para Reportes.
                Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.bar_chart, color: Colors.orange),
                    title: Text('Ver Reportes'),
                    onTap: () => Navigator.pushNamed(context, '/reportes'),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
