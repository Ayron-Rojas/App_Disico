import 'package:go_router/go_router.dart';

import '/pages/home_page.dart';
import '/pages/registro_epp_page.dart';
import '/pages/movimientos_page.dart';
import '/pages/reportes_page.dart';

class AppRouter {
  // Definir instancia de rutas a usar en toda la app
  static final router = GoRouter (
    // ruta inicio
    initialLocation: '/',
    // demas rutas
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/registro',
        name: 'registro',
        builder:(context, state) => RegistroEPPPage(),
      ),
      GoRoute(
        path: '/movimientos',
        name: 'movimientos',
        builder:(context, state) => MovimientosPage(),
      ),
      GoRoute(
        path: '/reportes',
        name: 'reportes',
        builder: (contex, state) => ReportesPage(),
      )
    ]
  );
}