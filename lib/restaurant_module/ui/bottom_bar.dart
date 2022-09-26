import 'package:flutter/material.dart';

class RestaurantBottomBar extends StatelessWidget {
  const RestaurantBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(Icons.home_outlined),
            Icon(Icons.calendar_today),
            Icon(Icons.search),
            Icon(Icons.favorite_border_outlined),
          ],
        ),
      ),
    );
  }
}
