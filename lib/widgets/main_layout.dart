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
        appBar: null,
        body: Stack(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                if (isExpanded) {
                  setState(() {
                    isExpanded = false;
                  });
                }
              },
              child: Padding(
                padding: EdgeInsets.only(left: isExpanded ? 250 : 60),
                child: widget.child,
              ),
            ),
            SizedBox(
              width: isExpanded ? 250 : 60,
              child: SideMenu(isExpanded: isExpanded, onToggle: toggleMenu),
            )
          ],
        ));
  }
}
