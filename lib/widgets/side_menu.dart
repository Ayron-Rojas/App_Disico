import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  bool _isExpanded = true;

  void _toggleMenu() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String currentRoute = GoRouterState.of(context).uri.toString();

    return Align( // ✅ Asegura que el menú tenga un ancho definido
      alignment: Alignment.centerLeft,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: _isExpanded ? 250 : 60,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.blueGrey[900],
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 5.0, spreadRadius: 2.0),
          ],
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: _toggleMenu,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/logoDisico.png',
                  width: _isExpanded ? 200 : 40,
                  height: _isExpanded ? 120 : 40,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Divider(color: Colors.white30),
            Expanded(
              child: Column(
                children: [
                  _buildMenuItem(context, Icons.dashboard, "Inicio", "/", currentRoute),
                  _buildMenuItem(context, Icons.home, "Registro", "/registro", currentRoute),
                  _buildMenuItem(context, Icons.swap_horiz, "Movimientos", "/movimientos", currentRoute),
                  _buildMenuItem(context, Icons.bar_chart, "Reportes", "/reportes", currentRoute),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String label, String route, String currentRoute) {
    final bool isActive = currentRoute == route;

    return Tooltip(
      message: _isExpanded ? "" : label,
      child: InkWell(
        onTap: () => context.go(route),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
            color: isActive ? Colors.blueGrey[700] : Colors.transparent,
            border: isActive
                ? Border(left: BorderSide(color: Colors.white, width: 4))
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min, // 🔹 Ajuste para evitar overflow
            children: [
              Icon(icon, color: Colors.white, size: 30),
              if (_isExpanded) ...[
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
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
