import 'package:astronauta/themes/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:astronauta/restaurant_module/model/restaurant.dart';

class RestaurantListApi {
  Future<List<Restaurant>> getRestaurantList() async {
    var response =
        await http.get(Uri.parse("$apiBase/search?api_key=NCq5KPZIYVblQIXmSJUzqU12dHedFjs1&q=restaurants+places&limit=5&offset=0&rating=g&lang=en"));

    Iterable objeto = convert.json.decode(response.body)["data"];

    if (response.statusCode == 200) {
      return objeto.map((restaurant) => Restaurant.fromJson(restaurant)).toList();
    } else {
      throw Exception("Not fetch items");
    }
  }
}
