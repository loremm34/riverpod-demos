import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(meal.title),
      ),
    );
  }
}
