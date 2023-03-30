import 'package:compie_assignment/screens/home_page.dart';
import 'package:compie_assignment/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PokedexApp extends StatelessWidget {
  PokedexApp({super.key});
  final MyTheme themeMode = GetIt.instance.get<MyTheme>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeMode.currentTheme(),
        debugShowCheckedModeBanner: false,
        title: "Pokedex App",
        initialRoute: "/",
        routes: {
          '/': (context) => const HomePage(),
        });
  }
}
