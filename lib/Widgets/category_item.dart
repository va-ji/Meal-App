import 'package:flutter/material.dart';

import '../Screens/screens.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key, required this.color, required this.title, required this.id})
      : super(key: key);

  final String title;
  final Color color;
  final String id;

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CatergoryMealsScreen.routeName,
        arguments: {'title': title, 'id': id});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
