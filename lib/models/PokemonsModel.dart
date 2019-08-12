class PokemonsResponse {
  int count;
  List<Pokemon> results;

  PokemonsResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['results'] != null) {
      results = new List<Pokemon>();
      json['results'].forEach((v) {
        results.add(new Pokemon.fromJson(v));
      });
    }
  }
}

class Pokemon {
  String name;
  String url;

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
