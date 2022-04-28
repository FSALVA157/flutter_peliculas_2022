import 'package:fl_peliculas/models/models.dart';
import 'package:fl_peliculas/screens/screens.dart';
import 'package:flutter/material.dart';


class AppRoutes{
  static const initialRoute = "home";
  static final optionsMenu = <RoutesModel>[
    RoutesModel(route: 'home', icon: Icons.home_filled, name: 'Home Screen', screen: const HomeScreen()),
    RoutesModel(route: 'details', icon: Icons.movie_outlined, name: 'Details Screen', screen: const DetailsScreen()),
  ];

  static Map<String, Widget  Function(BuildContext)> getAppRoutes(){
      Map<String, Widget  Function(BuildContext)> appRoutes = {};

      for (final item in optionsMenu) {
        appRoutes.addAll({
          item.route: ((BuildContext context) => item.screen)
        });
      }
      return appRoutes;
  }

}

