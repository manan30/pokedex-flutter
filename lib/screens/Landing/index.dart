import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/models/PokemonsModel.dart';
import 'package:pokedex/utils/API/index.dart';
import 'package:pokedex/widgets/PokemonList/index.dart';

class Landing extends StatefulWidget {
  @override
  _PokemonsState createState() {
    return _PokemonsState();
  }
}

class _PokemonsState extends State<Landing> {
  PokemonsModel _pokemons;

  initState() {
    super.initState();
    _getPokemons();
  }

  _getPokemons() {
    API.getPokemons().then((response) {
      setState(() {
        _pokemons = PokemonsModel.fromJson(json.decode(response.body));
      });
    }).catchError((onError) {
      print(onError);
      var x = onError;
    });
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(PageRouteBuilder(
            maintainState: true,
            opaque: true,
            pageBuilder: (context, _, __) => PokemonList(_pokemons))));

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
