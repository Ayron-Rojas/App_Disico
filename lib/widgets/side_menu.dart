import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60, // Menú estrecho para mostrar solo los íconos
      color: Colors.blue, // Puedes personalizar el color
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Ícono para la página de inicio
          IconButton(
            icon: const Icon(Icons.home),
            color: Colors.white,
            iconSize: 24,
            tooltip: 'Inicio',
            onPressed: () {
              // Navega a la ruta de inicio
              Navigator.pushNamed(context, '/');
            },
          ),
          const SizedBox(height: 20),
          // Ícono para Registro EPP
          IconButton(
            icon: const Icon(Icons.add),
            color: Colors.white,
            iconSize: 24,
            tooltip: 'Registro EPP',
            onPressed: () {
              Navigator.pushNamed(context, '/registro');
            },
          ),
          const SizedBox(height: 20),
          // Ícono para Movimientos
          IconButton(
            icon: const Icon(Icons.swap_horiz),
            color: Colors.white,
            iconSize: 24,
            tooltip: 'Movimientos',
            onPressed: () {
              Navigator.pushNamed(context, '/movimientos');
            },
          ),
          const SizedBox(height: 20),
          // Ícono para Reportes
          IconButton(
            icon: const Icon(Icons.bar_chart),
            color: Colors.white,
            iconSize: 24,
            tooltip: 'Reportes',
            onPressed: () {
              Navigator.pushNamed(context, '/reportes');
            },
          ),
        ],
      ),
    );
  }
}
