import 'package:flutter/material.dart';

class Inscricoes extends StatefulWidget {
  const Inscricoes({super.key});

  @override
  State<Inscricoes> createState() => _InscricoesState();
}

class _InscricoesState extends State<Inscricoes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Inscrições",
          style: TextStyle(
              fontSize: 25,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
