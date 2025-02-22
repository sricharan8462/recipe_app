import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> recipes = [
    {"name": "Pasta", "image": "assets/pasta.jpg"},
    {"name": "Pancakes", "image": "assets/pancakes.jpg"},
    {"name": "Salad", "image": "assets/salad.jpg"},
    {"name": "Burger", "image": "assets/burger.jpg"},
    {"name": "Pizza", "image": "assets/pizza.jpg"},
  ];

  final List<Map<String, String>> favoriteRecipes = [];

  void toggleFavorite(String recipeName) {
    setState(() {
      final index = favoriteRecipes.indexWhere((fav) => fav["name"] == recipeName);
      if (index != -1) {
        favoriteRecipes.removeAt(index);
      } else {
        final recipe = recipes.firstWhere((r) => r["name"] == recipeName);
        favoriteRecipes.add(recipe);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe Book"),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesScreen(favoriteRecipes: favoriteRecipes),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // ✅ Welcome Logo
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset("assets/logo.jpg", height: 120),
          ),
          Text("Welcome to Recipe App!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

          // ✅ Recipe List with Images
          Expanded(
            child: ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    leading: Image.asset(recipes[index]["image"]!, width: 80, height: 80, fit: BoxFit.cover),
                    title: Text(recipes[index]["name"]!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            recipe: recipes[index]["name"]!,
                            onFavoriteToggle: toggleFavorite,
                            isFavorite: favoriteRecipes.any((fav) => fav["name"] == recipes[index]["name"]),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
