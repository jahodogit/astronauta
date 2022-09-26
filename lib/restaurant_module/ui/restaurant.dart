import 'package:astronauta/restaurant_module/ui/bottom_bar.dart';
import 'package:astronauta/restaurant_module/ui/restaurant_tab_bar.dart';
import 'package:astronauta/themes/restaurant_theme.dart';
import 'package:flutter/material.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100,
          title: SizedBox(height: 80, child: Image.asset("assets/nasa.png")),
          actions: const [
            Icon(Icons.notifications_none_outlined, color: Colors.black),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(Icons.settings_outlined, color: Colors.black),
            ),
          ],
          backgroundColor: secundaryColorRestaurant,
          elevation: 0.0,
        ),
        backgroundColor: secundaryColorRestaurant,
        body: const RetsaurantTabBar(),
        bottomNavigationBar: const RestaurantBottomBar(),
      ),
    );
  }
}
