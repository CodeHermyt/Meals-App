import 'package:flutter/material.dart';
import 'package:mealsapp/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  @required
  final String id;
  @required
  final String title;
  @required
  final Color color;

  CategoryItem({this.id, this.title, this.color});

  void goToCategoryList(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.ref,
      arguments: {
        "id": id,
        "title": title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => goToCategoryList(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
