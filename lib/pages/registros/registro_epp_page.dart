import 'package:flutter/material.dart';

class RegistroEppPage extends StatelessWidget {
  const RegistroEppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registro Epps'),
        ),
        body: const Center(
          child: Text('Formulario'),
        ));
  }
}
