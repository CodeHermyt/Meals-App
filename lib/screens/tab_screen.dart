import 'package:flutter/material.dart';
import 'package:mealsapp/screens/category_screen.dart';
import 'package:mealsapp/screens/favorite_screen.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _pages = [
    CategoryScreen(),
    FavoriteScreen(),
  ];

  int _currentpage = 0;
  void _changePage(int index) {
    setState(() {
      _currentpage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meals"),
      ),
      drawer: MainDrawer(),
      body: _pages[_currentpage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        onTap: _changePage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _currentpage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: "Favorites"),
        ],
      ),
    );
  }
}
