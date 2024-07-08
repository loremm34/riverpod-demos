import 'package:flutter/material.dart';
import 'package:flutter_application_3/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_3/providers/favorites_provider.dart';

class MealDetails extends ConsumerWidget {
  const MealDetails({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleMealFavoriteStatus(meal);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(
                    seconds: 5,
                  ),
                  content: Text(
                      wasAdded ? 'Meal added as favorite' : 'Meal removed'),
                ),
              );
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
