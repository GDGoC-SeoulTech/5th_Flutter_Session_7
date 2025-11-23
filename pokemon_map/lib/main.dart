import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:pokemon_map/models.dart';
import 'package:pokemon_map/utils.dart';
import 'package:pokemon_map/widgets/map_view.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Map',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const PokemonMap(),
    );
  }
}

// -------------------------------------------------------------

class PokemonMap extends StatefulWidget {
  const PokemonMap({super.key});

  @override
  State<PokemonMap> createState() => _PokemonMapState();
}

class _PokemonMapState extends State<PokemonMap> {
  final LatLng _center = const LatLng(37.5665, 126.9780);
  late List<PokemonSpot> _pokemons;
  static const int _initialCount = 20;

  @override
  void initState() {
    super.initState();
    _pokemons = generateInitialPokemons(center: _center, count: _initialCount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Map'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetPokemons,
          ),
        ],
      ),
      body: PokemonMapView(
        center: _center,
        pokemons: _pokemons,
        onPokemonTap: _onTapPokemon,
      ),
    );
  }

  void _resetPokemons() {
    setState(() {
      _pokemons = generateInitialPokemons(
        center: _center,
        count: _initialCount,
      );
    });
  }

  void _onTapPokemon(PokemonSpot poke) {
    setState(() {
      _pokemons.remove(poke);
      _pokemons.add(spawnOnePokemon(center: _center));
    });
  }
}
