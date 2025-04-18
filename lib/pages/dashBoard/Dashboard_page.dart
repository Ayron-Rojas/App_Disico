import 'package:flutter/material.dart';
import 'package:app_disico/widgets/resumen_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final availableHeight = screenHeight - kToolbarHeight - 32; // ajustamos por AppBar + padding

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          SizedBox(
            height: availableHeight / 3,
            child: ResumenTable(
              title: "Resumen Registro",
              headers: ["Codigo", "Descripcion", "Marca", "Fecha", "Tipo"],
              data: [
                ["EPP001", "Casco de seguridad", "3M", "2025-03-30", "Protección"],
                ["EPP002", "Guantes anticorte", "Ansell", "2025-03-29", "Seguridad"],
                ["EPP003", "Gafas", "3M", "2025-03-28", "Visual"],
              ],
              route: "/registro",
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: availableHeight / 3,
            child: ResumenTable(
              title: "Resumen Movimientos",
              headers: ["Codigo", "Descripcion", "Marca", "Fecha", "Tipo"],
              data: [
                ["EPP001", "Casco de seguridad", "3M", "2025-03-30", "Ingreso"],
                ["EPP002", "Guantes anticorte", "Ansell", "2025-03-29", "Salida"],
              ],
              route: "/movimientos",
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: availableHeight / 3,
            child: ResumenTable(
              title: "Resumen Reportes",
              headers: ["Codigo", "Descripcion", "Marca", "Fecha", "Tipo"],
              data: [
                ["EPP001", "Casco de seguridad", "3M", "2025-03-30", "Dañado"],
                ["EPP002", "Guantes anticorte", "Ansell", "2025-03-29", "Pérdida"],
              ],
              route: "/reportes",
            ),
          ),
        ],
      ),
    );
  }
}
