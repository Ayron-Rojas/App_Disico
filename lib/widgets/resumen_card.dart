import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResumenTable extends StatelessWidget {
  final String title;
  final List<String> headers;
  final List<List<String>> data;
  final String route;

  const ResumenTable({
    super.key,
    required this.title,
    required this.headers,
    required this.data,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    // ✅ ScrollController creado aquí
    final ScrollController scrollController = ScrollController();

    return Container(
      width: double.infinity,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // ✅ Altura limitada y Scrollbar conectada con controlador
              SizedBox(
                height: 120,
                child: Scrollbar(
                  controller: scrollController,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth:
                                600), // ajusta si quieres más angosto o más ancho
                        child: DataTable(
                          columnSpacing: 16,
                          headingRowColor:
                              WidgetStateProperty.all(Colors.grey[200]),
                          columns: headers
                              .map(
                                (header) => DataColumn(
                                  label: Center(
                                    child: Text(
                                      header,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          rows: data
                              .map(
                                (row) => DataRow(
                                  cells: row
                                      .map(
                                        (cell) => DataCell(
                                          Center(child: Text(cell)),
                                        ),
                                      )
                                      .toList(),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => context.push(route),
                  child: const Text("Ver más"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
