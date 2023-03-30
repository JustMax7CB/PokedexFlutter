import 'package:compie_assignment/theme/theme.dart';
import 'package:flutter/material.dart';

import '../models/pokemon.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({super.key, required this.pokemon});
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: lightThemePokemonCardTheme,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${pokemon.name[0].toUpperCase()}${pokemon.name.substring(1)}",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Image.network(pokemon.imageURL, height: 150),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Type: ${pokemon.type[0].toUpperCase()}${pokemon.type.substring(1)}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  "Weight: ${pokemon.weight.toString()} kg",
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
