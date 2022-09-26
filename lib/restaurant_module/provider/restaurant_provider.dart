import 'package:astronauta/restaurant_module/model/restaurant.dart';
import 'package:astronauta/restaurant_module/repository/network/restaurant_api.dart';
import 'package:flutter/foundation.dart';

class RestaurantProvider extends ChangeNotifier {
  List<Restaurant> restaurants = [];

  void init() => getRestaurantList();

  Future<void> getRestaurantList() async {
    restaurants = await RestaurantListApi().getRestaurantList();
    notifyListeners();
  }
}
