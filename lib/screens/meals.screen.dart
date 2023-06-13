import 'package:flutter/material.dart';
import 'package:meal_app/models/meals.model.dart';
import 'package:meal_app/screens/meal_details.screen.dart';
import 'package:meal_app/screens/widgets/mealsWidgets/meal_item.widget.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('No meals found, maybe start adding some!'),
          const SizedBox(height: 20),
          Text(
            'Try Selecting Different Category',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return Card(
            child: MealItem(
              meal: meals[index],
              onSelectMeal: (meal) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => MealDetailsScreen(meal: meal),
                  ),
                );
              },
            ),
          );
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
