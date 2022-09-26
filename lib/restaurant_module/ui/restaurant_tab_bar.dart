import 'package:astronauta/restaurant_module/ui/all_tab.dart';
import 'package:astronauta/restaurant_module/ui/beer_tab.dart';
import 'package:astronauta/restaurant_module/ui/drinks_tab.dart';
import 'package:astronauta/restaurant_module/ui/happy_tab.dart';
import 'package:flutter/material.dart';

class RetsaurantTabBar extends StatelessWidget {
  const RetsaurantTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          const Expanded(
            child: TabBarView(children: [
              AllTab(),
              HappyHoursTab(),
              DrinksTab(),
              BeerTab(),
            ]),
          )
        ],
      ),
    );
  }
}
