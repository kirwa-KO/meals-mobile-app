import "package:flutter/material.dart";
import '../screens/CategoryMealScreen.dart';
import '../models/Category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({this.category});

  void selectCategory(BuildContext ctx) {
    // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    //   return CategoryMealScreen(category: this.category);
    // }));
    Navigator.of(ctx).pushNamed(CategoryMealScreen.routeName,
        arguments: {"category": this.category});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: (Container(
        padding: EdgeInsets.all(15),
        child: Text(
          this.category.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              this.category.color.withOpacity(0.7),
              this.category.color
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      )),
    );
  }
}
