import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

abstract class DATheme {
  static ThemeData theme = ThemeData(
    primaryColor: DAColors.primary,
    primarySwatch: Colors.grey,
    tabBarTheme: TabBarTheme(
        labelColor: DAColors.primary, unselectedLabelColor: Colors.grey),
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: DAColors.background,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    cupertinoOverrideTheme:
        NoDefaultCupertinoThemeData(primaryColor: DAColors.primary),
    iconTheme: IconThemeData(color: Colors.black),
    scaffoldBackgroundColor: DAColors.background,
    backgroundColor: DAColors.background,
    textTheme: GoogleFonts.montserratTextTheme()
        .apply(displayColor: Colors.black, bodyColor: Colors.black),
  );
}
