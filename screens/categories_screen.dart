import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  //const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
      ),
      // a Grid is basically like a list but the difference is that a grid,
      // we have multiple items sit next to each other, side by side instead
      // of just from top to bottom above each other.
      body: GridView(
        padding: const  EdgeInsets.all(25),
        // Categories
        children: DUMMY_CATEGORIES.map((catData) {
          return 
          CategoryItem(
            id: catData.id,
            title: catData.title,
            color: catData.color,
          );
        }).toList(),
        // gridDelegate is another named argument we have to provide
        /*
        Sliver in Flutter are just scrollable areas on the screen and 
        our grid just like the ListView is scrollable by default.

        GridDelegate : that simply means that for the grid, this takes
        care about structuring, layouting the grid, 

        WithMaxCrossAxisExtent means that this is a preconfigured class
        which allows us to define a maximum width for each grid item
        and then it will automatically create as many columns as we can fit
        items with that provided width next to each other.
      */
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          // maxCrossAxisExtent: the maximum extent or width of the tiles
          // ,of the grid item
          // it really depends on the device size
          // i.e : If we have a device with 300 pixels width, then we'll
          // only have one item per row and hence it will look like a list.
          // if we have a device with 500 pixel width , then we'll have two
          // items sit side by side.
          maxCrossAxisExtent: 200,
          /* 
          Besides <maxCrossAxisExtent> we can 
          also define <childAspectRatio> to define how the items should
          be sized regarding their height and width relation.
        */
          childAspectRatio: 3 / 2, // for 200 width , want to have a 300 heigth

          // define how much distance between our columns and rows in that grid
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
