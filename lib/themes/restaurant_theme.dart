import 'package:flutter/material.dart';

//Fortox's palette

Color primaryColorRestaurant = Colors.orange;
Color secundaryColorRestaurant = Colors.white;
Color primaryColorLigthRestaurant = const Color.fromARGB(80, 241, 2, 47);

InputBorder textFieldBorderDecoration = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5.0),
  borderSide: BorderSide(color: primaryColorRestaurant),
);

InputBorder textFieldBorderDecorationBlue = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5.0),
  borderSide: BorderSide(color: secundaryColorRestaurant),
);

InputBorder textFieldBorderDecorationWhite = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5.0),
  borderSide: const BorderSide(color: Colors.white),
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
      buttonTheme: ButtonThemeData(buttonColor: secundaryColorRestaurant),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: primaryColorRestaurant),
    );
  }
}
