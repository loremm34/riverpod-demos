import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails(
      {super.key, required this.meal, required this.onFavotiteToogle});

  final Meal meal;
  final void Function(Meal meal) onFavotiteToogle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onFavotiteToogle(meal);
            },
            icon: Icon(
              Icons.star,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                "Ingredients",
                style: Theme.of(context).textTheme.titleLarge!,
              ),
              for (final ingredient in meal.ingredients) Text(ingredient),
              const SizedBox(
                height: 14,
              ),
              Text(
                "Steps: ",
                style: Theme.of(context).textTheme.titleLarge!,
              ),
              for (final step in meal.steps)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Text(
                    step,
                    textAlign: TextAlign.center,
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
