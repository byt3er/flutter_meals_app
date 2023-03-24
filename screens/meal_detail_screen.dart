// Display the details about a single meal

import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  //const MealDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ****** NOTE ***************
    // every standalone widget which you load through routing, which
    // you navigate to withe Navigator needs a scaffold widget.
    // Because it adds the background, the appBar and also in general,
    // connects the widget to our material app and to the theme setup there,
    // to the fonts and so on.
    final mealId = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title:  Text('$mealId')),
        body: Center(
      child: Text('The meal -$mealId'),
    ));
  }
}
