import "package:flutter/material.dart";
import "../widgets/CategoryItem.dart";
import "../data/dummy_data.dart";

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KirwaMeal"),
      ),
      body: Container(
		padding: EdgeInsets.all(25),
		child: (GridView(
		  children:
			  DUMMY_CATEGORIES.map((cat) => CategoryItem(category: cat)).toList(),
		  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
			  maxCrossAxisExtent: 200,
			  childAspectRatio: 3 / 2,
			  crossAxisSpacing: 20,
			  mainAxisSpacing: 20),
		)),
	  ),
    );
  }
}
