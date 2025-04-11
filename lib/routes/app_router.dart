import 'package:app_disico/widgets/main_layout.dart';
import 'package:go_router/go_router.dart';

import '../pages/dashBoard/Dashboard_page.dart';
import '../pages/registros/registro_epp_page.dart';
import '../pages/movimientos/movimientos_page.dart';
import '../pages/reportes/reportes_page.dart';

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
        builder: (context, state) => MainLayout(child:DashboardPage()),
      ),
      GoRoute(
        path: '/registro',
        name: 'registro',
        builder:(context, state) => MainLayout(child: RegistroEppPage(),),
      ),
      GoRoute(
        path: '/movimientos',
        name: 'movimientos',
        builder:(context, state) => MainLayout(child: MovimientosEppPage()),
      ),
      GoRoute(
        path: '/reportes',
        name: 'reportes',
        builder: (contex, state) => MainLayout(child: ReportesPage()),
      )
    ]
  );
}