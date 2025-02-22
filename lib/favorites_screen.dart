import 'package:flutter/material.dart';
import 'details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, String>> favoriteRecipes;

  FavoritesScreen({required this.favoriteRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Recipes")),
      body: ListView.builder(
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(favoriteRecipes[index]["image"]!,
                  width: 80, height: 80, fit: BoxFit.cover),
              title: Text(favoriteRecipes[index]["name"]!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      recipe: favoriteRecipes[index]["name"]!,
                      onFavoriteToggle: (String recipeName) {},
                      isFavorite: true,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
