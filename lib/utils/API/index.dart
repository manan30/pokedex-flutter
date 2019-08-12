import 'package:http/http.dart' as http;

import '../Constants.dart';

class API {
  static Future getPokemons() {
    return http.get(Constants.POKEMONS_URL);
  }
}
