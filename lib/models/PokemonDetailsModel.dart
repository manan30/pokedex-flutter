class PokemonDetailsResponse {
  PokemonDetails details;

  PokemonDetailsResponse.fromJson(Map<String, dynamic> json) {
    if (json.length != 0) {
      details = PokemonDetails.fromJson(json);
    }
  }
}

class PokemonDetails {
  int id;
  int baseExperience;
  int height;
  int weight;
  String name;
  _Sprites sprites;

  PokemonDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    baseExperience = json['base_experience'];
    height = json['height'];
    weight = json['weight'];
    name = json['name'];
    sprites = _Sprites.fromJson(json['sprites']);
  }
}

class _Sprites {
  String backDefault;
  String backFemale;
  String backShiny;
  String backShinyFemale;
  String frontDefault;
  String frontFemale;
  String frontShiny;
  String frontShinyFemale;

  _Sprites.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backFemale = json['back_female'];
    backShiny = json['back_shiny'];
    backShinyFemale = json['back_shiny_female'];
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'];
    frontShinyFemale = json['front_shiny_female'];
  }
}
