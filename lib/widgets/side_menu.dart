import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {
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
    return MouseRegion(
      onExit: (_) {
        setState(() {
          _isExpanded = false;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: _isExpanded ? 250 : 80,
        decoration: BoxDecoration(
          color: Colors.blueGrey[900],
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 5.0, spreadRadius: 2.0),
          ],
        ),
        child: Column(
          children: [
            // Logo
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _isExpanded
                      ? Text(
                          "DisApp",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Icon(Icons.menu, color: Colors.white),
                  IconButton(
                    icon: Icon(Icons.menu_open, color: Colors.white),
                    onPressed: _toggleMenu,
                  ),
                ],
              ),
            ),
            Divider(color: Colors.white30),
            Expanded(
              child: Column(
                children: [
                  _buildMenuItem(context, Icons.home, "Registro", "/registro"),
                  _buildMenuItem(context, Icons.swap_horiz, "Movimientos", "/movimientos"),
                  _buildMenuItem(context, Icons.bar_chart, "Reportes", "/reportes"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String label, String route) {
    final String currentRoute = GoRouter.of(context).location;
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
            children: [
              Icon(icon, color: Colors.white),
              if (_isExpanded) ...[
                SizedBox(width: 10),
                Text(label, style: TextStyle(color: Colors.white)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
