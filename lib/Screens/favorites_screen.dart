import 'package:flutter/material.dart';

import '../models/models.dart';
import '../Widgets/wigets.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key, required this.favoriteMeals})
      : super(key: key);
  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text(
            'Looks like you dont have any favorite meals yet - Start adding some!!'),
      );
    } else {
      return ListView.builder(
          itemCount: favoriteMeals.length,
          itemBuilder: (ctx, idx) {
            return MealItem(
              title: favoriteMeals[idx].title,
              imageUrl: favoriteMeals[idx].imageUrl,
              duration: favoriteMeals[idx].duration,
              complexity: favoriteMeals[idx].complexity,
              affordability: favoriteMeals[idx].affordability,
              id: favoriteMeals[idx].id,
            );
          });
    }
  }
}
