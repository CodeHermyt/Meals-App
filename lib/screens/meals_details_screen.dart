import 'package:flutter/material.dart';
import 'package:mealsapp/constants/dummy_category_list.dart';
import 'package:mealsapp/models/meals.dart';

class MealDetailScreen extends StatelessWidget {
  static const ref = "/meal-details";

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              ContentTitle(
                title: "Ingredients",
              ),
              ListContentWidget(
                selectedMeal: selectedMeal,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              ContentTitle(title: "Steps"),
              ListContentWidget(
                selectedMeal: selectedMeal,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              "#${index + 1}",
                            ),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider(),
                      ],
                    );
                  },
                  itemCount: selectedMeal.steps.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListContentWidget extends StatelessWidget {
  const ListContentWidget({@required this.selectedMeal, @required this.child});

  final Meal selectedMeal;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}

class ContentTitle extends StatelessWidget {
  const ContentTitle({this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        title,
        // ignore: deprecated_member_use
        style: Theme.of(context).textTheme.title,
      ),
    );
  }
}
