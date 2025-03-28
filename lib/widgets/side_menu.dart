import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onToggle;

  const SideMenu({
    super.key,
    required this.isExpanded,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final String currentRoute = GoRouterState.of(context).uri.toString();

    return Align(
      alignment: Alignment.centerLeft,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isExpanded ? 250 : 60,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.blueGrey[900],
          boxShadow: [
            BoxShadow(
                color: Colors.black26, blurRadius: 5.0, spreadRadius: 2.0),
          ],
        ),
        child: Column(
          children: [
            // Logo (se usa como botón para expandir/contraer)
            GestureDetector(
              onTap:
                  onToggle, // Ahora usa la función externa para alternar el menú
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/logoDisico.png',
                  width: isExpanded ? 200 : 40,
                  height: isExpanded ? 120 : 40,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const Divider(color: Colors.white30),
            Expanded(
              child: Column(
                children: [
                  _buildMenuItem(
                      context, Icons.dashboard, "Inicio", "/", currentRoute),
                  _buildMenuItem(context, Icons.home, "Registro", "/registro",
                      currentRoute),
                  _buildMenuItem(context, Icons.swap_horiz, "Movimientos",
                      "/movimientos", currentRoute),
                  _buildMenuItem(context, Icons.bar_chart, "Reportes",
                      "/reportes", currentRoute),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String label,
    String route, String currentRoute) {
  final bool isActive = currentRoute == route;

  return Tooltip(
    message: isExpanded ? "" : label,
    child: InkWell(
      onTap: () => context.go(route),
      child: Container(
        width: isExpanded ? 250 : 60, // Fijamos el ancho del contenedor
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.blueGrey[700] : Colors.transparent,
          border: isActive
              ? const Border(left: BorderSide(color: Colors.white, width: 4))
              : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
            if (isExpanded) ...[
              const SizedBox(width: 10), // Espacio entre icono y texto
              Expanded( // Asegura que el texto nunca se salga del ancho disponible
                child: Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ],
        ),
      ),
    ),
  );
}
}
