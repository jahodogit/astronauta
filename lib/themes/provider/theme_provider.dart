import 'package:flutter/foundation.dart';

class ThemeProvider extends ChangeNotifier {
  late bool isRestaurant;

  ThemeProvider() {
    isRestaurant = false;
  }

  switchTheme() {
    isRestaurant = !isRestaurant;
    notifyListeners();
  }
}
