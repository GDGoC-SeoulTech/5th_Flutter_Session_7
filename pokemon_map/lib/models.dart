class PokemonSpot {
  final String id;
  final String name;
  final String assetPath;
  final double lat;
  final double lon;
  bool caught;

  PokemonSpot({
    required this.id,
    required this.name,
    required this.assetPath,
    required this.lat,
    required this.lon,
    this.caught = false,
  });
}
