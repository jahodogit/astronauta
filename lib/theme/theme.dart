import 'package:flutter/material.dart';

//Fortox's palette

Color primaryColor = const Color.fromARGB(230, 241, 2, 47);
Color secundaryColor = const Color.fromARGB(230, 6, 1, 1);
Color primaryColorLigth = const Color.fromARGB(230, 255, 171, 64);

InputBorder textFieldBorderDecoration = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5.0),
  borderSide: BorderSide(color: primaryColor),
);

InputBorder textFieldBorderDecorationBlue = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5.0),
  borderSide: BorderSide(color: secundaryColor),
);

InputBorder textFieldBorderDecorationWhite = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5.0),
  borderSide: const BorderSide(color: Colors.white),
);

class AstronautaTheme {
  static ThemeData generarTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.light().copyWith(primary: primaryColor),
      primaryColor: primaryColor,
      primaryColorDark: secundaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
      ),
      backgroundColor: secundaryColor,
      buttonTheme: ButtonThemeData(buttonColor: secundaryColor),
      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: primaryColor),
    );
  }
}
