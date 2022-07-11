import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/data/dummy_data.dart';
import 'package:flutter_complete_guide/models/Meal.dart';
import 'package:flutter_complete_guide/screens/FiltersScreen.dart';
import './screens/CategoryMealScreen.dart';
import './screens/MealScreen.dart';
import './screens/TabsScreen.dart';
import './screens/CategoryScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "glutenFree": false,
    "lactoseFree": false,
    "vegan": false,
    "vegetarian": false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritesMeals = [];

  void _setFilter(filterData) {
    // print(filterData);
    setState(() {
      this._availableMeals = DUMMY_MEALS.where((meal) {
        if (this._filters["glutenFree"] && !meal.isGlutenFree) return false;
        if (this._filters["lactoseFree"] && !meal.isLactoseFree) return false;
        if (this._filters["vegan"] && !meal.isVegan) return false;
        if (this._filters["vegetarian"] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  void _toogleFavorites(String mealId) {
    final existingIndex =
        this._favoritesMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        this._favoritesMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        this
            ._favoritesMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isFavoriteMeal(String mealId) {
    return this._favoritesMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
              // bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              // bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleMedium: TextStyle(
                  fontSize: 20,
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.bold))),
      //   home: TabsScreen(),
      initialRoute: "/",
      routes: {
        "/": (context) => TabsScreen(_favoritesMeals),
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(this._availableMeals),
        MealScreen.routeName: (context) => MealScreen(this._toogleFavorites, this.isFavoriteMeal),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilter)
      },
      //   onGenerateRoute: (settings) {
      //     print(settings.arguments);
      //   },
      //   onUnknownRoute: (settings) {
      //     return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      //   },
    );
  }
}
