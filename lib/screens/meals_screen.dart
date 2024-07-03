import 'package:flutter/material.dart';
import 'package:flutter_application_3/data/default_data.dart';
import 'package:flutter_application_3/models/meal.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(meals[index].title),
              SizedBox(),
            ],
          ),
        );
      },
    );

    if (meals.isEmpty) {
      content = const Center(child: Text("Ничего не найдено"));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: content,
      ),
    );
  }
}
