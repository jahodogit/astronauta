import 'package:astronauta/island_module/provider/island_provider.dart';
import 'package:astronauta/restaurant_module/provider/restaurant_provider.dart';
import 'package:astronauta/themes/provider/theme_provider.dart';
import 'package:astronauta/themes/restaurant_theme.dart';
import 'package:provider/provider.dart';

import 'package:astronauta/route.dart';
import 'package:astronauta/themes/astronauta_theme.dart';
import 'package:flutter/material.dart';
import 'package:astronauta/home/ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => IslandProvider()),
        ChangeNotifierProvider(create: (_) => RestaurantProvider()..init()),
      ],
      child: Consumer<ThemeProvider>(
        builder: ((context, ThemeProvider themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Astronauta",
            theme: themeProvider.isRestaurant ? RestaurantTheme.generarTheme() : AstronautaTheme.generarTheme(),
            home: const HomePage(),
            routes: buildAppRoutes(),
          );
        }),
      ),
    );
  }
}
