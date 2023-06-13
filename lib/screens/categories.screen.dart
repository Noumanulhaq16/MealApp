import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy.data.dart';
import 'package:meal_app/models/category.model.dart';
import 'package:meal_app/screens/meals.screen.dart';
import 'package:meal_app/screens/widgets/categoriesWidgets/grid_items.widgets.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  void _selectCategory(BuildContext context, Category category) {
    final filterMeal = dummyMeals
        .where((element) => element.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filterMeal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoriesGridItems(
              category: category,
              onSelectCategory: () => _selectCategory(context, category),
            )
        ],
      ),
    );
  }
}
