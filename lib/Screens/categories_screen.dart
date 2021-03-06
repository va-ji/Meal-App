import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../Widgets/wigets.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25.0),
      children: DUMMY_CATEGORIES
          .map((catItem) => CategoryItem(
                color: catItem.color,
                title: catItem.title,
                id: catItem.id,
              ))
          .toList(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
