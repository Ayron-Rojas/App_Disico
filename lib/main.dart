import 'package:app_disico/routes/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
