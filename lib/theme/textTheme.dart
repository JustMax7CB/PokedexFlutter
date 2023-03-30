import 'package:compie_assignment/theme/colors.dart';
import 'package:flutter/material.dart';

TextTheme lightTextTheme = TextTheme(
  headlineLarge:
      TextStyle(fontSize: 36, fontWeight: FontWeight.w600, color: black),
  bodyMedium:
      TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: black),
  bodyLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: black),
  bodySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: black),
);

TextTheme darkTextTheme = TextTheme(
  headlineLarge:
      TextStyle(fontSize: 36, fontWeight: FontWeight.w600, color: white),
  bodyMedium:
      TextStyle(fontSize: 18, fontWeight: FontWeight.w300, color: white),
  bodyLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: white),
  bodySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: white),
);
