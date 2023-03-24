import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  //const CategoryItem({Key key}) : super(key: key);
  final String id;
  // title on the Card
  final String title;
  // background color of the Card
  final Color color;

  const CategoryItem({this.id, this.title, this.color});

  void selectCategory(BuildContext ctx) {
    // Navigator is a class build into Flutter which helps you with
    // navigating between your screens, that's the core idea.
    // **** like theme, mediaQuery, it needs to be connected to the
    // <context> because, context is the object which has information
    // about this widget and position in the widget tree and that is super
    // important for the navigator to know BECAUSE it needs to know what
    // the current screen is so that it can add this page you want to go
    // to as a screen on top of it.

    //<builder> defines which widget should be build with the help of
    // MaterialPageRoute. We need MaterialPageRoute as a wrapper so to say,
    // to handle things like the animation from the old to the new page
    // and so on.
    //<fullScreenDialog> is a boolean which you can set to control whether
    // you want to have that default animation where the new page kind of
    // slides in or if it should basically be a full screen overlay rather
    // <settings> we become important later.
    // same for <maintainState>
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    // Inkwell it's basically a GestureDetector which also fires off
    // ripple effect, so this Material Design effect you have when you tap
    // something, where you have these waves comming you of the point
    // where you tapped it.
    return InkWell(
      onTap: () => selectCategory(context), // pointer to the fun()
      // set the color of the waves
      splashColor: Theme.of(context).primaryColor,
      //borderRadius of the InkWell should match the border radius of
      // the child container.
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            // directions
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          // get access to the Global theme
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
