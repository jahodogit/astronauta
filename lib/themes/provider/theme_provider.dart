import 'package:flutter/foundation.dart';

class ThemeProvider extends ChangeNotifier {
  bool isRestaurant = false;

  switchTheme(bool val) {
    isRestaurant = val;
    notifyListeners();
  }
}
