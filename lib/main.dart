import 'package:compie_assignment/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'app.dart';
import 'services/api.dart';
import 'services/shared_preferences.dart';
import 'dart:developer' as dev;

void main() async {
  GetIt.instance.registerSingleton<PokeAPI>(PokeAPI());
  GetIt.instance
      .registerSingleton<SharedPreferencesService>(SharedPreferencesService());
  GetIt.instance.registerSingleton<MyTheme>(MyTheme());
  runApp(
    PokedexApp(),
  );
}
