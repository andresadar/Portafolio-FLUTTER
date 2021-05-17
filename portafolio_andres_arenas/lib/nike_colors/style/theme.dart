import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

abstract class NCTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: NCColors.background,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    iconTheme: IconThemeData(color: Colors.white),
    scaffoldBackgroundColor: NCColors.background,
    backgroundColor: NCColors.background,
    textTheme: GoogleFonts.montserratTextTheme()
        .apply(displayColor: Colors.black, bodyColor: Colors.black),
  );
}
