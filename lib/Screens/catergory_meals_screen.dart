import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import '../Widgets/wigets.dart';
import '../models/models.dart';

class CatergoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  const CatergoryMealsScreen({Key? key, required this.availableMeals})
      : super(key: key);

  @override
  State<CatergoryMealsScreen> createState() => _CatergoryMealsScreenState();
}

class _CatergoryMealsScreenState extends State<CatergoryMealsScreen> {
  // final String categoryId;
  var init = false;
  List<Meal>? _displayedMeals;
  String? _categoryTitle;

  @override
  void didChangeDependencies() {
    if (!init) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      _categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      _displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      init = true;
    }

    super.didChangeDependencies();
  }

  void removeItem(String mealID) {
    setState(() {
      _displayedMeals!.removeWhere((meal) => meal.id == mealID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category meals screen'),
      ),
      body: ListView.builder(
          itemCount: _displayedMeals!.length,
          itemBuilder: (ctx, idx) {
            return MealItem(
              title: _displayedMeals![idx].title,
              imageUrl: _displayedMeals![idx].imageUrl,
              duration: _displayedMeals![idx].duration,
              complexity: _displayedMeals![idx].complexity,
              affordability: _displayedMeals![idx].affordability,
              id: _displayedMeals![idx].id,
            );
          }),
    );
  }
}
