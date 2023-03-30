import 'package:compie_assignment/theme/colors.dart';
import 'package:compie_assignment/theme/textTheme.dart';
import 'package:flutter/material.dart';

class MyTheme extends ChangeNotifier {
  static bool _isDark = true;

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: bgLightColor,
  textTheme: lightTextTheme,
  appBarTheme: AppBarTheme(
    titleTextStyle: lightTextTheme.headlineLarge,
    centerTitle: true,
    toolbarHeight: 70,
  ),
  cardTheme: CardTheme(
    color: cardBgLightColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    shadowColor: black,
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(width: 1, color: black),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(width: 1, color: black),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(width: 1, color: focusedFormFieldLight),
    ),
    filled: true,
    suffixIconColor: focusedFormFieldLight,
    hintStyle: lightTextTheme.bodyMedium,
    fillColor: formFieldFillLight,
  ),
);

BoxDecoration lightThemePokemonCardTheme = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  boxShadow: const <BoxShadow>[
    BoxShadow(blurRadius: 2, offset: Offset(2, 1), blurStyle: BlurStyle.outer)
  ],
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: bgDarkColor,
  textTheme: darkTextTheme,
  appBarTheme: AppBarTheme(
    titleTextStyle: lightTextTheme.headlineLarge,
    centerTitle: true,
    toolbarHeight: 70,
  ),
  cardTheme: CardTheme(
    color: cardBgDarkColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    shadowColor: black,
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(width: 1, color: black),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(width: 1, color: black),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(width: 1, color: focusedFormFieldDark),
    ),
    filled: true,
    suffixIconColor: focusedFormFieldDark,
    hintStyle: darkTextTheme.bodyMedium,
    fillColor: formFieldFillDark,
  ),
);

BoxDecoration darkThemePokemonCardTheme = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  boxShadow: const <BoxShadow>[
    BoxShadow(blurRadius: 2, offset: Offset(2, 1), blurStyle: BlurStyle.outer)
  ],
);
