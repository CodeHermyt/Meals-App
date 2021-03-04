import 'package:flutter/material.dart';
import 'package:mealsapp/constants/dummy_category_list.dart';
import 'package:mealsapp/models/meals.dart';
import 'package:mealsapp/widgets/meals_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const String ref = "/category-meals";
  // @required
  // final String categoryId;
  // @required
  // final String categoryTitle;

  // CategoryMealsScreen({this.categoryId, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryTitle = routeArgs["title"];
    final String categoryId = routeArgs["id"];
    final List<Meal> categoryMeals = DUMMY_MEALS
        .where((item) => item.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemBuilder: (ctx, index) {
          return MeaLItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      )),
    );
  }
}
