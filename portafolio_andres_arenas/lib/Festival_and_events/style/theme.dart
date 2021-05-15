import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portafolio_andres_arenas/Festival_and_events/style/colors.dart';

abstract class FAETheme {
  static ThemeData theme = ThemeData(
    
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: FAEColors.background,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    iconTheme: IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: FAEColors.background,
    backgroundColor: FAEColors.background,
    textTheme: GoogleFonts.montserratTextTheme()
        .apply(displayColor: Colors.white, bodyColor: Colors.white),
  );
}
