import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión EPP'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Menú', style: TextStyle(color: Colors.white, fontSize: 24)),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Registro EPP'),
              onTap: () {
                Navigator.pushNamed(context, '/registro');
              },
            ),
            ListTile(
              title: Text('Movimientos'),
              onTap: () {
                Navigator.pushNamed(context, '/movimientos');
              },
            ),
            ListTile(
              title: Text('Reportes'),
              onTap: () {
                Navigator.pushNamed(context, '/reportes');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Bienvenido a la Gestión EPP'),
      ),
    );
  }
}
