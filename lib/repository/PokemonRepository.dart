import 'package:pokedex/models/PokemonsModel.dart';
import 'package:pokedex/utils/API/APIBaseHelper.dart';

class PokemonRepository {
  APIBaseHelper _helper = APIBaseHelper();

  Future<List<Pokemon>> getAllPokemons() async {
    final response = await _helper.get(url: '?offset=0&limit=964');
    return PokemonsResponse.fromJson(response).results;
  }
}
