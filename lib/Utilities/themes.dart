import 'package:flutter/material.dart';

import '../services/shared_services.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    appBarTheme: AppBarTheme(
      backgroundColor: SharedService.primaryColor,
    ),
    primaryColor: SharedService.primaryColor,
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white60,
    colorScheme: const ColorScheme.dark(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black12,
    ),
  );
}
