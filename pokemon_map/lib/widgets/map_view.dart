import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:pokemon_map/models.dart';
import 'package:pokemon_map/widgets/map_marker.dart';

class PokemonMapView extends StatelessWidget {
  final LatLng center;
  final List<PokemonSpot> pokemons;
  final void Function(PokemonSpot) onPokemonTap;

  const PokemonMapView({
    super.key,
    required this.center,
    required this.pokemons,
    required this.onPokemonTap,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(initialCenter: center, initialZoom: 12),
      children: [
        TileLayer(
          urlTemplate: 'https://basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.pokemon_map',
        ),

        MarkerLayer(
          markers: pokemons.map((poke) {
            return PokemonMarker(
              pokemon: poke,
              onTap: () => onPokemonTap(poke),
            ).toMarker();
          }).toList(),
        ),
      ],
    );
  }
}
