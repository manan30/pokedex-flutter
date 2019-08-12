import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  final String name;

  PokemonCard(this.name);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.6,
      child: Container(
        height: 96,
        child: Text(name),
      ),
    );
  }
}
