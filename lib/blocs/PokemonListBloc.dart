import 'dart:async';

import 'package:pokedex/models/PokemonsModel.dart';
import 'package:pokedex/repository/PokemonRepository.dart';
import 'package:pokedex/utils/API/APIResponse.dart';

class PokemonListBloc {
  PokemonRepository _pokemonRepository;
  StreamController _pokemonController;

  StreamSink<APIResponse<List<Pokemon>>> get pokemonListSink =>
      _pokemonController.sink;

  Stream<APIResponse<List<Pokemon>>> get pokemonListStream =>
      _pokemonController.stream;

  PokemonListBloc() {
    _pokemonController = StreamController<APIResponse<List<Pokemon>>>();
    _pokemonRepository = PokemonRepository();
    fetchPokemons();
  }

  fetchPokemons() async {
    pokemonListSink.add(APIResponse.loading('Fetching pokemons'));
    try {
      List<Pokemon> pokemons = await _pokemonRepository.getAllPokemons();
      pokemonListSink.add(APIResponse.completed(pokemons));
    } catch (e) {
      pokemonListSink.add(APIResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _pokemonController?.close();
  }
}
