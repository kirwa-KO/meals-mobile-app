import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_complete_guide/screens/FiltersScreen.dart';

class MainDrawer extends StatelessWidget {
  Widget BuildListTile(String text, IconData icon, Function onTap) {
    return (ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
            fontFamily: "Quicksand", fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).accentColor,
          alignment: Alignment.centerLeft,
          child: Text(
            "Cooking Up!",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        BuildListTile("Meals", Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed("/");
        }),
        BuildListTile("Filters", Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        }),
      ]),
    );
  }
}
