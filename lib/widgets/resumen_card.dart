import 'package:flutter/material.dart';

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
              // ✅ Scroll limitado a una altura específica
              SizedBox(
                height: 100, // Este valor puede ajustarse para mostrar solo 3 filas
                child: Scrollbar(
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      columnSpacing: 16,
                      headingRowColor: MaterialStateProperty.all(Colors.grey[200]),
                      columns: headers
                          .map(
                            (header) => DataColumn(
                              label: Center(
                                child: Text(
                                  header,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
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
                                      Center(
                                        child: Text(cell),
                                      ),
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
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, route),
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
