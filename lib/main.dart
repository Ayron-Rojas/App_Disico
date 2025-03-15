import 'package:app_disico/routes/app_router.dart';
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
    return MaterialApp.router(
      title: 'Gestión EPP',
      // Configuracion de rutas
      routerConfig: AppRouter.router,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
