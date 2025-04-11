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
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Expanded(
              // 👈 Este es el truco clave para evitar el overflow
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: headers
                      .map((header) => DataColumn(label: Text(header)))
                      .toList(),
                  rows: data
                      .map((row) => DataRow(
                            cells: row
                                .map((cell) => DataCell(Text(cell.toString())))
                                .toList(),
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
