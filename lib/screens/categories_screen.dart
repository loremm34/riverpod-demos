import 'package:flutter/material.dart';
import 'package:flutter_application_3/data/default_data.dart';
import 'package:flutter_application_3/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appbar title"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: availableCategories.map(
          (category) {
            return CategoryGridItem(category: category);
          },
        ).toList(),
      ),
    );
  }
}
