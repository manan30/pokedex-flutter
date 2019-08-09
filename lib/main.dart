import 'package:flutter/material.dart';
import 'package:pokedex/screens/Landing/index.dart';

void main() => runApp(Pokedex());

class Pokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      home: Landing(),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}
