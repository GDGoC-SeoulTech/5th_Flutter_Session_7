import 'dart:math';
import 'package:latlong2/latlong.dart';
import 'package:pokemon_map/models.dart';

final Random _random = Random();

List<PokemonSpot> generateInitialPokemons({
  required LatLng center,
  int count = 20,
  int idMin = 1,
  int idMax = 100,
  double maxOffsetDeg = 0.05,
}) {
  return List.generate(count, (_) {
    final id = idMin + _random.nextInt(idMax - idMin + 1);

    final dx = (_random.nextDouble() * 2 - 1) * maxOffsetDeg;
    final dy = (_random.nextDouble() * 2 - 1) * maxOffsetDeg;

    return PokemonSpot(
      id: id,
      lat: center.latitude + dx,
      lon: center.longitude + dy,
    );
  });
}

PokemonSpot spawnOnePokemon({
  required LatLng center,
  int idMin = 1,
  int idMax = 100,
  double maxOffsetDeg = 0.05,
}) {
  final id = idMin + _random.nextInt(idMax - idMin + 1);

  final dx = (_random.nextDouble() * 2 - 1) * maxOffsetDeg;
  final dy = (_random.nextDouble() * 2 - 1) * maxOffsetDeg;

  return PokemonSpot(
    id: id,
    lat: center.latitude + dx,
    lon: center.longitude + dy,
  );
}
