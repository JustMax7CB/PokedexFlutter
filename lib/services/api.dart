import 'dart:convert';

import 'package:compie_assignment/models/pokemon.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:http/http.dart';

class PokeAPI {
  static String apiUrl = "https://pokeapi.co/api/v2/pokemon/";
  PokeAPI();

  Future<Pokemon> fetchPokemon(String pokemon) async {
    Uri url = Uri.parse(apiUrl + pokemon);
    Response response = await http.get(url);
    Map<String, dynamic> result = jsonDecode(response.body);
    Map<String, dynamic> pokemonJSON = {};
    pokemonJSON['name'] = pokemon;
    pokemonJSON['imageURL'] =
        result['sprites']['other']['home']['front_default'];
    pokemonJSON['type'] = result['types'][0]['type']['name'];
    pokemonJSON['weight'] = result['weight'];
    return Pokemon.fromJson(pokemonJSON);
  }

  getAutocompletePokemons(String chars) => _getPokemonsList(chars);

  Future<List<String>> _getPokemonsList(String query) async {
    Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=1000');
    Response response = await http.get(url);
    List results = jsonDecode(response.body)['results'];
    List<String> pokemonsNames =
        results.map((e) => e['name'] as String).toList();
    List<String> relevantPokemons =
        pokemonsNames.where((element) => element.startsWith(query)).toList();
    return relevantPokemons;
  }
}
