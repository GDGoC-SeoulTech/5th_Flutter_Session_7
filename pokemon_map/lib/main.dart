import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';
import 'package:pokemon_map/models.dart';
import 'package:pokemon_map/utils.dart';
import 'package:pokemon_map/widgets/map_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const PokemonMapApp());
}

class PokemonMapApp extends StatelessWidget {
  const PokemonMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.white,
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
