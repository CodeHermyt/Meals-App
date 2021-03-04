import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  @required
  final String title;
  @required
  final Color color;

  CategoryItem({this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
