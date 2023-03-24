import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  //const CategoryMealsScreen({Key key}) : super(key: key);
  // const CategoryMealsScreen(
  //   this.categoryId,
  //   this.categoryTitle,
  // );

  @override
  Widget build(BuildContext context) {
    // get information about the route that was loaded to display this
    // widget.
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    final categoryMeals = DUMMY_MEALS.where((meal) {
      // return true if we want to keep it in the new list which is
      // generated or false if we don't want to include it in the new
      // list.
      // .contains return true if this list contains a specific value
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          //check all meals and find the meals which include the category
          // of the category we selected in the categories list.

          // return Text(categoryMeals[index].title);
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
