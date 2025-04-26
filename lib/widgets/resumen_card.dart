import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
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
  Widget build(BuildContext contex) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              /// Sección con tabla de altura fija y scroll interno
              Container(
                height: 150,
                child: Scrollbar(
                  controller: scrollController,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 600),
                        child: DataTable2(
                          columnSpacing: 12,
                          horizontalMargin: 12,
                          headingRowColor:
                              WidgetStateProperty.all(Colors.grey[200]),
                          headingTextStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          columns: headers.map((header) {
                            return DataColumn(
                              label: Text(header), // ← sin Center aquí
                            );
                          }).toList(),
                          rows: data.map((row) {
                            return DataRow(
                              cells: row.map((cell) {
                                return DataCell(
                                  Text(cell), // ← también sin Center aquí
                                );
                              }).toList(),
                            );
                          }).toList(),
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
                  onPressed: () => contex.push(route),
                  child: const Text("Ver más"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
