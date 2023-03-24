import 'package:flutter/material.dart';
import '../screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  // const MealItem({Key key}) : super(key: key);

  // properties needed to properly display a meal in list of meals.
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity; // Type define in meal.dart
  final Affordability affordability; // Type define in meal.dart

  const MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Costly';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    // go to the mealDetailScreen()
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: {
        id: id,
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        // using <:shape> we change the way this Card looks.
        // instead of having a rectangle, we can get a rectangle with
        // round corners where we can define how strong the rounding effect
        // should be
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4, // shadow behind the card
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          // Stack widget, allows us to add items on top of each other in 3D
          // space, so you can have an image with title on top of the image,
          // so as part of the image (effect)

          // stack container itself is defined by its biggest child
          // (which is the image)
          Stack(
            children: <Widget>[
              // ClipRRect() add rounded corner to the Image
              // cut off the corners of the image so that you have the feeling
              // of having rounded corners because the image is simply forced
              // into that form.
              ClipRRect(
                // ClipRect use any other widget as a child and force it into
                // a certain form, for example into a widget where the top
                // corners are rounded
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),

                //define the child which should be clipped
                child: Image.network(
                  imageUrl,
                  // height of the image
                  height: 250,
                  // width = should take all the width
                  width: double.infinity,
                  // fit the image nicely into the box
                  // BoxFit.cover will both resize and crop the image
                  // so that it fits nicely into the container
                  fit: BoxFit.cover,
                ),
              ),

              //
              // display title on top of the image

              // Position( used with Stack() widget) allows us to position
              // the child widget in an absolute coordinate space
              Positioned(
                // bottom-right corner
                bottom: 20,
                right: 10,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  width: 300,
                  color: Colors.black54,
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 26, color: Colors.white),
                    softWrap: true,
                    // if the text doesn't fit into the card, even if wraping
                    // now it would just fade out and not overflow and not overflow
                    overflow: TextOverflow.fade,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: [
                    const Icon(Icons.schedule),
                    const SizedBox(
                      width: 6,
                    ),
                    Text('$duration min'),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.work),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(complexityText),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.money),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(affordabilityText),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
