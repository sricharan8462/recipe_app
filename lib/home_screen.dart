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
      final index =
          favoriteRecipes.indexWhere((fav) => fav["name"] == recipeName);
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
            icon: Icon(Icons.favorite, color: Colors.red, size: 28),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FavoritesScreen(favoriteRecipes: favoriteRecipes),
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
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Image.asset("assets/logo.jpg", height: 120),
                SizedBox(height: 10),
                Text(
                  "Welcome to Recipe App!",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                SizedBox(height: 10),
                Text(
                  "Discover and cook delicious recipes!",
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ],
            ),
          ),

          // ✅ Recipe Grid View (Better UI)
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 🟢 Two columns for better layout
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.85, // Adjusted for better layout
              ),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                bool isFavorite = favoriteRecipes
                    .any((fav) => fav["name"] == recipes[index]["name"]);

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          recipe: recipes[index]["name"]!,
                          onFavoriteToggle: toggleFavorite,
                          isFavorite: isFavorite,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15)),
                          child: Image.asset(
                            recipes[index]["image"]!,
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          recipes[index]["name"]!,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                        SizedBox(height: 5),
                        IconButton(
                          icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red),
                          onPressed: () {
                            toggleFavorite(recipes[index]["name"]!);
                          },
                        ),
                      ],
                    ),
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
