import 'package:flutter/material.dart';
import 'package:flutter_application_3/data/default_data.dart';
import 'package:flutter_application_3/screens/meals_screen.dart';
import 'package:flutter_application_3/widgets/category_grid_item.dart';
import 'package:flutter_application_3/models/category.dart';
import 'package:flutter_application_3/models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onFavotiteToogle});

  final void Function(Meal meal) onFavotiteToogle;

  void _onCategoryTap(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MealsScreen(
            title: category.title,
            meals: filteredMeals,
            onFavotiteToogle: onFavotiteToogle,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: availableCategories.map(
            (category) {
              return CategoryGridItem(
                category: category,
                selectCategory: () {
                  _onCategoryTap(context, category);
                },
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
