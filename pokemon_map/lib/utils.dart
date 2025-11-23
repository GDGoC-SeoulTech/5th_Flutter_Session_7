import 'dart:math';
import 'package:latlong2/latlong.dart';
import 'package:pokemon_map/models.dart';

final _rand = Random();

List<PokemonSpot> generateRandomPokemonsAround(
  LatLng center, {
  int count = 10,
  double maxOffsetInDegrees = 0.003,
}) {
  final List<PokemonSpot> list = [];

  for (var i = 0; i < count; i++) {
    final dx = (_rand.nextDouble() * 2 - 1) * maxOffsetInDegrees;
    final dy = (_rand.nextDouble() * 2 - 1) * maxOffsetInDegrees;

    list.add(
      PokemonSpot(
        id: 'poke_$i',
        name: 'Pokemon #$i',
        assetPath: 'assets/pokemon/poke_${i % 3}.png',
        lat: center.latitude + dx,
        lon: center.longitude + dy,
      ),
    );
  }
  return list;
}
