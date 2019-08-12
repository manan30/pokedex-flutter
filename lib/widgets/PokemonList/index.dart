import 'package:flutter/material.dart';
import 'package:pokedex/models/PokemonsModel.dart';
import 'package:pokedex/widgets/PokemonCard/index.dart';

class PokemonList extends StatelessWidget {
  final PokemonsModel pokemons;

  PokemonList(this.pokemons);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokemonList'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
        itemCount: pokemons.count,
        itemBuilder: (context, index) => PokemonCard(),
      ),
    );
  }
}
