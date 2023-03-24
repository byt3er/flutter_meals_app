import 'package:flutter/foundation.dart';

// enum is essentially a type that helps you create a choice amongst
// a couple of alternatives
enum Complexity {
  // behind the scenes, what Dart does is it simply uses 0, 1, 2 here
  // it maps these values here to normal integers but you as a developer
  // can work with the labels which is of course simpler for humans
  // and for computer numbers are used
  Simple, // 0
  Challenging, // 1
  Hard // 2
}

// how affordable that meal is. The  affordability could have values
enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  // these properties are used for filtering
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

 const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });
}
