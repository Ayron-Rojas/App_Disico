import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/registro_epp_page.dart';
import 'pages/movimientos_page.dart';
import 'pages/reportes_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión EPP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Define la ruta inicial y las rutas nombradas
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/registro': (context) => RegistroEPPPage(),
        '/movimientos': (context) => MovimientosPage(),
        '/reportes': (context) => ReportesPage(),
      },
    );
  }
}
