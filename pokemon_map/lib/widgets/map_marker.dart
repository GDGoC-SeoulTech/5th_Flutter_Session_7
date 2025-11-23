import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:pokemon_map/models.dart';

class PokemonMarker extends StatelessWidget {
  final PokemonSpot pokemon;
  final VoidCallback onTap;

  const PokemonMarker({super.key, required this.pokemon, required this.onTap});

  Marker toMarker() {
    return Marker(
      point: LatLng(pokemon.lat, pokemon.lon),
      width: 72,
      height: 72,
      alignment: Alignment.center,
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Image.asset(
        pokemon.assetPath,
        width: 64,
        height: 64,
        fit: BoxFit.contain,
      ),
    );
  }
}
