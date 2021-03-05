import 'package:flutter/material.dart';
import 'package:mealsapp/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 120,
              padding: EdgeInsets.all(20),
              color: Theme.of(context).accentColor,
              alignment: Alignment.centerLeft,
              child: Text(
                "Cooking up!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            BuildListTile(
              icon: Icons.restaurant,
              titleText: "Meals",
              tapHandler: () {
                Navigator.of(context).pushReplacementNamed("/");
              },
            ),
            BuildListTile(
              icon: Icons.settings,
              titleText: "Filters",
              tapHandler: () {
                Navigator.of(context).pushReplacementNamed(FiltersScreen.ref);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BuildListTile extends StatelessWidget {
  final IconData icon;
  final String titleText;
  final Function tapHandler;
  const BuildListTile({
    @required this.icon,
    @required this.titleText,
    @required this.tapHandler,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(
        titleText,
        style: TextStyle(
            fontFamily: "RobotoCondensed",
            fontWeight: FontWeight.bold,
            fontSize: 26),
      ),
      onTap: tapHandler,
    );
  }
}
