import "package:flutter/material.dart";
import 'package:flutter_complete_guide/data/dummy_data.dart';
import 'package:flutter_complete_guide/models/Meal.dart';

class MealScreen extends StatelessWidget {
  static const routeName = "/meal-details";
  String mealId;
  Meal meal;

  final Function _isFavoriteMeal;
  final Function _toogleFavorites;

  MealScreen(this._toogleFavorites, this._isFavoriteMeal);

  @override
  Widget build(BuildContext context) {
    this.mealId = ModalRoute.of(context).settings.arguments;
    this.meal =
        DUMMY_MEALS.firstWhere((mealItam) => mealItam.id == this.mealId);

    Widget TitleWidget(BuildContext context, String text) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    }

    Widget ListElements({child}) {
      return (Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        height: 150,
        width: 300,
        child: child,
      ));
    }

    return Scaffold(
      appBar: AppBar(title: Text('${this.meal.title}')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              child: Image.network(
                this.meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            TitleWidget(context, "Ingredients"),
            ListElements(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(this.meal.ingredients[index]),
                    ),
                  );
                },
                itemCount: this.meal.ingredients.length,
              ),
            ),
            TitleWidget(context, "Steps"),
            ListElements(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${(index + 1)}'),
                        ),
                        title: Text(
                          this.meal.steps[index],
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: this.meal.ingredients.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //   Navigator.of(context).pop(this.mealId);
          this._toogleFavorites(this.mealId);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          this._isFavoriteMeal(this.mealId) ? Icons.star : Icons.star_border,
          color: Colors.white,
        ),
      ),
    );
  }
}
