import 'package:flutter/material.dart';
import 'package:mealsapp/screens/category_meals_screen.dart';
import 'package:mealsapp/screens/category_screen.dart';
import 'package:mealsapp/screens/filters_screen.dart';
import 'package:mealsapp/screens/meals_details_screen.dart';
import 'package:mealsapp/screens/tab_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MealsApp",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
            // ignore: deprecated_member_use
            body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            // ignore: deprecated_member_use
            body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            // ignore: deprecated_member_use
            title: TextStyle(
              fontFamily: "RobotoCondensed",
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
      // home: CategoryScreen(),
      initialRoute: "/",
      routes: {
        "/": (ctx) => TabsScreen(),
        CategoryScreen.ref: (ctx) => CategoryScreen(),
        CategoryMealsScreen.ref: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.ref: (ctx) => MealDetailScreen(),
        FiltersScreen.ref:(ctx)=> FiltersScreen(),
      },
    );
  }
}
