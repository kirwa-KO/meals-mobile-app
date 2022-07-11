import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/Meal.dart';
import '../data/dummy_data.dart';
import '../models/Category.dart';
import '../widgets/MealItem.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = "/category-meal";
  final availableMeals;

  CategoryMealScreen(this.availableMeals);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
//   final Category category;
  Category category;
  List<Meal> displayedMeals;
  var loadedWidget = false;

  @override
  void didChangeDependencies() {
    if (loadedWidget == false) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, Category>;
      category = routeArgs['category'];
      displayedMeals = widget.availableMeals.where((meal) {
        // return true;
        return meal.categories.contains(category.id) as bool;
      }).toList();
      loadedWidget = true;
    }
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      this.displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
        //   return MealItem(displayedMeals[index], this.removeMeal);
          return MealItem(displayedMeals[index]);
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
