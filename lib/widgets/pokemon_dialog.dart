import 'package:compie_assignment/models/pokemon.dart';
import 'package:flutter/material.dart';

import 'pokemon_card.dart';

class PokemonDialogBox extends StatelessWidget {
  const PokemonDialogBox({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return PokemonCard(pokemon: pokemon);
  }
}
