import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokedex/screens/PokemonList/index.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(PageRouteBuilder(
            maintainState: true,
            opaque: true,
            pageBuilder: (context, _, __) => PokemonList())));

    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        gradient: LinearGradient(colors: [
          Colors.grey,
          Colors.blueGrey,
        ]),
      ),
      child: Center(
        child: Text(
          'Pokedex',
          style: TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
