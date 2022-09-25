import 'package:astronauta/restaurant_module/model/restaurant.dart';
import 'package:astronauta/restaurant_module/repository/network/restaurant_api.dart';

import 'package:astronauta/themes/restaurant_theme.dart';
import 'package:flutter/material.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(
          Icons.star,
          color: Colors.black,
        ),
        actions: const [Icon(Icons.notifications_none_outlined, color: Colors.black), Icon(Icons.settings_outlined, color: Colors.black)],
        backgroundColor: secundaryColorRestaurant,
        elevation: 0.0,
      ),
      backgroundColor: secundaryColorRestaurant,
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            List<Restaurant> restaurants = await RestaurantListApi().getRestaurantList();

            for (var element in restaurants) {
              print(element.image);
            }
          },
          child: const Text("Api test"),
        ),
      ),
    );
  }
}
