class PokemonsModel {
  final int count;
  final String next;
  final String previous;
  final List<dynamic> results;

  PokemonsModel({this.count, this.next, this.previous, this.results});

  factory PokemonsModel.fromJson(Map json) {
    return PokemonsModel(
      count: json['count'],
      next: json['next'],
      previous: json['prev'],
      results: json['results'],
    );
  }
}
