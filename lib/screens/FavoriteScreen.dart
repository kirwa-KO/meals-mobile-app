import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/Meal.dart';
import 'package:flutter_complete_guide/widgets/MealItem.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> _favoritesMeals;

  FavoriteScreen(this._favoritesMeals);

  @override
  Widget build(BuildContext context) {
    if (this._favoritesMeals.isEmpty) {
      return Center(
        child: Text("No Favourites meals added..!!"),
      );
    }
    return (ListView.builder(
      itemBuilder: (ctx, index) {
        return MealItem(this._favoritesMeals[index]);
      },
      itemCount: this._favoritesMeals.length,
    ));
  }
}
