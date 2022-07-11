import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/Meal.dart';
import 'package:flutter_complete_guide/screens/CategoryScreen.dart';
import 'package:flutter_complete_guide/screens/FavoriteScreen.dart';
import 'package:flutter_complete_guide/widgets/MainDrawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favoritesMeals;

  const TabsScreen(this._favoritesMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _screens;

  int _selectedItem = 0;

  @override
  void initState() {
    _screens = [
      {"screen": CategoryScreen(), "title": "Categories"},
      {"screen": FavoriteScreen(widget._favoritesMeals), "title": "Favorites"},
    ];
    super.initState();
  }

  void _selectTab(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedItem]['title']),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedItem]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectTab,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedItem,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
