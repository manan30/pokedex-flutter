import 'package:flutter/material.dart';
import 'package:pokedex/models/PokemonsModel.dart';
import 'package:pokedex/screens/Details/index.dart';
import 'package:pokedex/widgets/PokemonCard/index.dart';

class PokemonList extends StatelessWidget {
  final List<Pokemon> pokemons;

  const PokemonList({Key key, this.pokemons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokemonList'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: PokemonCard(pokemons[index].name),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Details(index.toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}
