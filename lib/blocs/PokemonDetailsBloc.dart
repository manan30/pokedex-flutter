import 'dart:async';

import 'package:pokedex/models/PokemonDetailsModel.dart';
import 'package:pokedex/repository/PokemonRepository.dart';
import 'package:pokedex/utils/API/APIResponse.dart';

class PokemonDetailsBloc {
  PokemonRepository _pokemonRepository;
  StreamController _detailsController;

  StreamSink<APIResponse<PokemonDetails>> get pokemonDetailsSink =>
      _detailsController.sink;

  Stream<APIResponse<PokemonDetails>> get pokemonDetailsStream =>
      _detailsController.stream;

  PokemonDetailsBloc() {
    _pokemonRepository = PokemonRepository();
    _detailsController = StreamController<APIResponse<PokemonDetails>>();
  }

  fetchPokemonDetails(String url) async {
    pokemonDetailsSink.add(APIResponse.loading('Fetching pokemon details'));
    try {
      PokemonDetails _details = await _pokemonRepository.getPokemonDetails(url);
      pokemonDetailsSink.add(APIResponse.completed(_details));
    } catch (e) {
      pokemonDetailsSink.add(APIResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _detailsController?.close();
  }
}
