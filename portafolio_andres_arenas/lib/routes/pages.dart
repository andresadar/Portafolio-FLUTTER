import 'package:flutter/cupertino.dart';
import 'package:portafolio_andres_arenas/Festival_and_events/pages/fae_home_page.dart';
import 'package:portafolio_andres_arenas/Recipe_food/pages/home/rf_home.dart';
import 'package:portafolio_andres_arenas/Travel_app/pages/ta_home.dart';
import 'package:portafolio_andres_arenas/doctor_app/pages/da_home.dart';
import 'package:portafolio_andres_arenas/main.dart';
import 'package:portafolio_andres_arenas/routes/routes.dart';

abstract class Pages {
  static const String INITIAL = Routes.HOME;
  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.HOME: (_) => SelectProject(),
    Routes.FESTIVAL_AND_EVENT: (_) => FAEHomePage(),
    Routes.RECIPE_FOOD: (_) => RFHomePage(),
    Routes.TRAVEL_APP: (_) => TAHomePage(),
    Routes.DOCTOR_APP: (_) => DAHomePage(),
  };
}
