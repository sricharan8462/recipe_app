import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<String> recipes = [
    "Pasta",
    "Pancakes",
    "Salad",
    "Burger",
    "Soup",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recipe Book")),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index]),
          );
        },
      ),
    );
  }
}
