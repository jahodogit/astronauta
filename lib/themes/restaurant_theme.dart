import 'package:flutter/material.dart';

//Fortox's palette

Color primaryColorRestaurant = Colors.orange;
Color secundaryColorRestaurant = Colors.white;
Color primaryColorLigthRestaurant = const Color.fromARGB(80, 241, 2, 47);

InputBorder textFieldBorderDecoration = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5.0),
  borderSide: BorderSide(color: primaryColorRestaurant),
);

TabBarTheme tabBarTheme = TabBarTheme(
  unselectedLabelColor: Colors.black,
  labelStyle: const TextStyle(color: Colors.white),
  labelColor: Colors.white,
  indicator: ShapeDecoration(
      color: Colors.orange,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.orange),
      )),
  //indicatorSize: TabBarIndicatorSize.tab,
);

class RestaurantTheme {
  static ThemeData generarTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.light().copyWith(primary: primaryColorRestaurant),
      primaryColor: primaryColorRestaurant,
      primaryColorDark: secundaryColorRestaurant,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColorRestaurant,
      ),
      backgroundColor: secundaryColorRestaurant,
      buttonTheme: ButtonThemeData(
        buttonColor: secundaryColorRestaurant,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: primaryColorRestaurant),
      tabBarTheme: tabBarTheme,
    );
  }
}
