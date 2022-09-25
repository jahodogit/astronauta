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
          actions: const [Icon(Icons.notifications_none_outlined, color: Colors.black), Icon(Icons.settings_outlined, color: Colors.black)],
          backgroundColor: secundaryColorRestaurant,
          elevation: 0.0,
        ),
        backgroundColor: secundaryColorRestaurant,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Favorites", style: Theme.of(context).textTheme.headline3),
                  const Icon(Icons.add),
                ],
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: 30,
                child: TabBar(
                  tabs: [
                    Tab(child: Text("All")),
                    Tab(
                        child: Text(
                      "Happy hours",
                      softWrap: false,
                      overflow: TextOverflow.visible,
                      textScaleFactor: 0.8,
                    )),
                    Tab(child: Text("Drinks")),
                    Tab(child: Text("Beer")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
