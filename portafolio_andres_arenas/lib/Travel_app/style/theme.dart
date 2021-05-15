import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

abstract class TATheme {
  static ThemeData theme = ThemeData(
    primaryColor: TAColors.primary,
    primarySwatch: Colors.grey,
    tabBarTheme: TabBarTheme(
        labelColor: TAColors.primary, unselectedLabelColor: Colors.grey),
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: TAColors.background,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    cupertinoOverrideTheme:
        NoDefaultCupertinoThemeData(primaryColor: TAColors.primary),
    iconTheme: IconThemeData(color: Colors.black),
    scaffoldBackgroundColor: TAColors.background,
    backgroundColor: TAColors.background,
    textTheme: GoogleFonts.montserratTextTheme()
        .apply(displayColor: Colors.black, bodyColor: Colors.black),
  );
}
