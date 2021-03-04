import 'package:flutter/material.dart';
import 'package:mealsapp/constants/dummy_category_list.dart';
import 'package:mealsapp/models/category_item.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meals"),
      ),
      body: GridView(
        padding: EdgeInsets.all(10),
        children: DUMMY_CATEGORIES
            .map((ct) => CategoryItem(
                  title: ct.title,
                  color: ct.color,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
        ),
      ),
    );
  }
}
