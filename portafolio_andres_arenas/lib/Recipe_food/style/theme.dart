import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

abstract class RFTheme {
  static ThemeData theme = ThemeData(
    primaryColor: RFColors.primary,
    primarySwatch: Colors.deepPurple,
    tabBarTheme: TabBarTheme(
        labelColor: RFColors.primary, unselectedLabelColor: Colors.grey),
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: RFColors.background,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    cupertinoOverrideTheme:
        NoDefaultCupertinoThemeData(primaryColor: RFColors.primary),
    iconTheme: IconThemeData(color: Colors.black),
    scaffoldBackgroundColor: RFColors.background,
    backgroundColor: RFColors.background,
    textTheme: GoogleFonts.montserratTextTheme()
        .apply(displayColor: Colors.black, bodyColor: Colors.black),
  );
}
