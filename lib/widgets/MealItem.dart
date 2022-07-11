import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/MealScreen.dart';
import '../models/Meal.dart';

class MealItem extends StatelessWidget {
  final Meal mealData;

  const MealItem(this.mealData);

  String get complexityText {
    switch (this.mealData.complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Hard:
        return "Hard";
      default:
        return "Unkown";
    }
  }

  String get affordabilityText {
    switch (this.mealData.affordability) {
      case Affordability.Affordable:
        return "Cheap";
      case Affordability.Pricey:
        return "Pricey";
      case Affordability.Luxurious:
        return "Expensive";
      default:
        return "Unkown";
    }
  }

  void selectCard(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealScreen.routeName, arguments: this.mealData.id)
        .then((mealId) {
      if (mealId != null) {
        print(mealId);
        // this.removeMeal(mealId)
      }
      ;
      //   print(mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCard(context),
      child: (Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  this.mealData.imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      width: 300,
                      color: Colors.black54,
                      child: Text(
                        this.mealData.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      )))
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(
                      width: 6,
                    ),
                    Text('${this.mealData.duration} min')
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(
                      width: 6,
                    ),
                    Text(complexityText)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(
                      width: 6,
                    ),
                    Text(affordabilityText)
                  ],
                ),
              ],
            ),
          )
        ]),
      )),
    );
  }
}
