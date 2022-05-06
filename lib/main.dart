import 'package:fl_peliculas/routes/app_routes.dart';
import 'package:fl_peliculas/screens/screens.dart';
import 'package:fl_peliculas/themes/app_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      theme: AppTheme.lightTheme,
        );
  }
}