import 'package:flutter/material.dart';
import 'side_menu.dart';

class MainLayout extends StatefulWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  bool isExpanded = true;

  void toggleMenu() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Gestión EPP'),
    ),
    body: Row(
      children: [
        SizedBox(
          width: isExpanded ? 250 : 60, // Se asegura de que el menú tenga ancho fijo
          child: SideMenu(
            isExpanded: isExpanded,
            onToggle: toggleMenu,
          ),
        ),
        Expanded(
          child: widget.child,
        ),
      ],
    ),
  );
}

}
