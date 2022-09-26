import 'package:flutter/material.dart';

import 'package:astronauta/restaurant_module/provider/restaurant_provider.dart';
import 'package:astronauta/restaurant_module/model/restaurant.dart';
import 'package:provider/provider.dart';

class AllTab extends StatelessWidget {
  const AllTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RestaurantProvider restaurantProvider = Provider.of<RestaurantProvider>(context);
    return restaurantProvider.restaurants.isEmpty
        ? const Center(child: SizedBox(height: 30, width: 30, child: CircularProgressIndicator()))
        : Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Align(alignment: AlignmentDirectional.bottomStart, child: Text("All", style: Theme.of(context).textTheme.headline4)),
                Expanded(
                  child: ListView.builder(
                      itemCount: restaurantProvider.restaurants.length,
                      itemBuilder: (_, index) {
                        Restaurant restaurant = restaurantProvider.restaurants[index];
                        return buildRestaurantElement(restaurant, context);
                      }),
                ),
              ],
            ),
          );
  }

  Widget buildRestaurantElement(Restaurant restaurant, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            fit: StackFit.passthrough,
            children: [
              SizedBox(
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    restaurant.image,
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      //borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.orange,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                restaurant.title,
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
