class PokemonSpot {
  final int id;
  final double lat;
  final double lon;

  PokemonSpot({required this.id, required this.lat, required this.lon});

  String get assetPath => 'assets/pokemon/poke_$id.png';
}
