import 'package:astronauta/island_module/ui/island_table.dart';
import 'package:astronauta/restaurant_module/ui/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:astronauta/home/ui/home.dart';

Map<String, WidgetBuilder> buildAppRoutes() {
  return {
    "/home": (BuildContext context) => const HomePage(),
    "/islands": (BuildContext context) => const IslandTablePage(),
    "/restaurant": (BuildContext context) => const RestaurantPage(),
  };
}
