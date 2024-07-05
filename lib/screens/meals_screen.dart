import 'package:flutter/material.dart';
import 'package:flutter_application_3/data/default_data.dart';
import 'package:flutter_application_3/models/meal.dart';
import 'package:flutter_application_3/widgets/meal_item.dart';
import 'package:flutter_application_3/screens/meal_details.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen(
      {super.key,
      this.title,
      required this.meals,
      required this.onFavotiteToogle});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onFavotiteToogle;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MealDetails(
            meal: meal,
            onFavotiteToogle: onFavotiteToogle,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return MealItem(
          meal: meals[index],
          onMealTap: selectMeal,
        );
      },
    );

    if (meals.isEmpty) {
      content = const Center(child: Text("Ничего не найдено"));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: content,
      ),
    );
  }
}
