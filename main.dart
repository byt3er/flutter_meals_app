import 'package:flutter/material.dart';
import './screens/meal_detail_screen.dart';

import './screens/category_meals_screen.dart';

import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        // general text theme, replace some part of the default text theme
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            bodyMedium: const TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            titleLarge: const TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),

      // SCREEN
      // Now technically, there is absolutely no difference between a
      // screen and a widget, every widget can be used as a screen, it's
      // only a term that describe a widget which we use to control an
      // entire page on our app.
      //(Instead of "screen" , you can use "page" or "route" - these terms)

      // <home> always mark the entry point of your application, the root
      // screen of the app.
      // home: MyHomePage(),

      //home: CategoriesScreen(),

      // here string <key> identify a route and route is really just
      // a screen

      initialRoute: '/', //default is '/'
      routes: {
        // <home> always also has an automatically named route with "/"
        '/': (ctx) => CategoriesScreen(),
        //*** Named Routes */
        // '/categories': your-page.com/categories
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),


      } ,
    );
  }
}

