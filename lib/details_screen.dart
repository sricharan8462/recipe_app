import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String recipe;

  DetailsScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe)),
      body: Center(child: Text("Details about $recipe")),
    );
  }
}
