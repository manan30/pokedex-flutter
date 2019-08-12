import 'package:flutter/material.dart';
import 'package:pokedex/blocs/PokemonListBloc.dart';
import 'package:pokedex/models/PokemonsModel.dart';
import 'package:pokedex/utils/API/APIResponse.dart';
import 'package:pokedex/widgets/PokemonList/index.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  PokemonListBloc _pokemonBloc;

  @override
  initState() {
    super.initState();
    _pokemonBloc = PokemonListBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => _pokemonBloc.fetchPokemons(),
        child: StreamBuilder<APIResponse<List<Pokemon>>>(
          stream: _pokemonBloc.pokemonListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case Status.LOADING:
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
                case Status.COMPLETED:
                  return PokemonList(
                    pokemons: snapshot.data.data,
                  );
                case Status.ERROR:
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
                        'Error occurred',
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
            return Container();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pokemonBloc.dispose();
    super.dispose();
  }
}
