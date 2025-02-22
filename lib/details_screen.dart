import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String recipe;
  final Function(String) onFavoriteToggle;
  final bool isFavorite;

  DetailsScreen({
    required this.recipe,
    required this.onFavoriteToggle,
    required this.isFavorite,
  });

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late bool isFavorite;

  final Map<String, String> recipeImages = {
    "Pasta": "assets/pasta.jpg",
    "Pancakes": "assets/pancakes.jpg",
    "Salad": "assets/salad.jpg",
    "Burger": "assets/burger.jpg",
    "Pizza": "assets/pizza.jpg",
  };

  final Map<String, Map<String, String>> recipeDetails = {
    "Pasta": {
      "ingredients": "• 200g Pasta (Spaghetti or Penne)\n"
          "• 2 tbsp Olive Oil\n"
          "• 2 Cloves of Garlic (Minced)\n"
          "• 1 can Diced Tomatoes\n"
          "• 1 tsp Dried Basil & Oregano\n"
          "• ½ cup Parmesan Cheese\n"
          "• Salt & Pepper to taste",

      "instructions": "1️⃣ **Boil the Pasta:**\n"
          "   - Bring a large pot of salted water to a rolling boil.\n"
          "   - Add pasta and cook until al dente (about 8-10 minutes).\n"
          "   - Drain and set aside.\n\n"
          "2️⃣ **Prepare the Sauce:**\n"
          "   - Heat olive oil in a pan over medium heat.\n"
          "   - Add minced garlic and sauté until fragrant.\n"
          "   - Pour in diced tomatoes, basil, and oregano.\n"
          "   - Simmer for 10-15 minutes, stirring occasionally.\n\n"
          "3️⃣ **Combine Everything:**\n"
          "   - Toss the cooked pasta into the sauce.\n"
          "   - Stir well, ensuring every strand is coated.\n"
          "   - Sprinkle Parmesan cheese on top before serving.\n\n"
          "🍽️ **Enjoy your homemade Pasta with Garlic Tomato Sauce!**"
    },
    "Pancakes": {
      "ingredients": "• 1½ cups All-Purpose Flour\n"
          "• 2 tbsp Sugar\n"
          "• 1½ tsp Baking Powder\n"
          "• ½ tsp Salt\n"
          "• 1¼ cups Milk\n"
          "• 1 Egg\n"
          "• 2 tbsp Melted Butter\n"
          "• 1 tsp Vanilla Extract",

      "instructions": "1️⃣ **Prepare the Batter:**\n"
          "   - In a bowl, whisk together flour, sugar, baking powder, and salt.\n"
          "   - In another bowl, beat the egg, then add milk, butter, and vanilla.\n"
          "   - Slowly pour the wet ingredients into the dry mixture, stirring until just combined.\n\n"
          "2️⃣ **Cook the Pancakes:**\n"
          "   - Heat a non-stick pan over medium heat.\n"
          "   - Pour ¼ cup of batter onto the pan.\n"
          "   - Cook until bubbles form on the surface, then flip and cook for another 1-2 minutes.\n\n"
          "3️⃣ **Serve and Enjoy:**\n"
          "   - Stack pancakes on a plate.\n"
          "   - Drizzle with maple syrup and top with berries or butter.\n\n"
          "🥞 **Enjoy your fluffy pancakes!**"
    },
    "Salad": {
      "ingredients": "• 2 cups Lettuce (Chopped)\n"
          "• 1 Cucumber (Sliced)\n"
          "• ½ cup Cherry Tomatoes (Halved)\n"
          "• ¼ cup Olives (Sliced)\n"
          "• ¼ cup Feta Cheese (Crumbled)\n"
          "• 2 tbsp Olive Oil\n"
          "• 1 tbsp Lemon Juice\n"
          "• Salt & Pepper to taste",

      "instructions": "1️⃣ **Prepare the Vegetables:**\n"
          "   - Wash and chop lettuce into bite-sized pieces.\n"
          "   - Slice cucumber into thin rounds and halve cherry tomatoes.\n"
          "   - Add them to a large salad bowl.\n\n"
          "2️⃣ **Make the Dressing:**\n"
          "   - In a small bowl, whisk together olive oil, lemon juice, salt, and pepper.\n\n"
          "3️⃣ **Assemble the Salad:**\n"
          "   - Add olives and crumbled feta cheese to the vegetables.\n"
          "   - Drizzle the dressing over the salad and toss gently.\n\n"
          "🥗 **Your fresh and healthy salad is ready to enjoy!**"
    },
    "Burger": {
      "ingredients": "• 1/2 lb Ground Beef\n"
          "• 1 tsp Salt & Black Pepper\n"
          "• 1 slice Cheese (Cheddar or American)\n"
          "• 1 Burger Bun\n"
          "• 1 Lettuce Leaf\n"
          "• 1 Tomato Slice\n"
          "• 1 tbsp Mayonnaise or Ketchup",

      "instructions": "1️⃣ **Prepare the Patty:**\n"
          "   - Season ground beef with salt and pepper.\n"
          "   - Shape into a patty (about ¾-inch thick).\n\n"
          "2️⃣ **Cook the Burger:**\n"
          "   - Heat a grill or pan over medium heat.\n"
          "   - Cook the patty for 3-4 minutes per side until well-browned.\n"
          "   - Place cheese on top and cover until melted.\n\n"
          "3️⃣ **Assemble the Burger:**\n"
          "   - Toast the bun lightly.\n"
          "   - Spread mayo/ketchup on the bun.\n"
          "   - Add lettuce, tomato, and the patty.\n\n"
          "🍔 **Your delicious homemade burger is ready to enjoy!**"
    },
    "Pizza": {
      "ingredients": "• 2 cups All-Purpose Flour\n"
          "• 1 tsp Instant Yeast\n"
          "• 1 tsp Sugar\n"
          "• ¾ cup Warm Water\n"
          "• 2 tbsp Olive Oil\n"
          "• ½ cup Tomato Sauce\n"
          "• 1 cup Mozzarella Cheese\n"
          "• Toppings (Pepperoni, Bell Peppers, Olives, etc.)",

      "instructions": "1️⃣ **Prepare the Dough:**\n"
          "   - In a bowl, mix flour, yeast, sugar, and salt.\n"
          "   - Add warm water and olive oil, then knead for 5-7 minutes.\n"
          "   - Cover and let it rise for 1 hour until doubled in size.\n\n"
          "2️⃣ **Roll Out the Dough:**\n"
          "   - Preheat oven to 220°C (430°F).\n"
          "   - Roll the dough into a round shape and place on a baking tray.\n\n"
          "3️⃣ **Add Toppings:**\n"
          "   - Spread tomato sauce evenly over the dough.\n"
          "   - Sprinkle mozzarella cheese and add desired toppings.\n\n"
          "4️⃣ **Bake the Pizza:**\n"
          "   - Place the tray in the oven and bake for 12-15 minutes.\n"
          "   - Remove when the crust is golden and cheese is bubbly.\n\n"
          "🍕 **Slice and enjoy your homemade pizza!**"
    }
  };

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    final details = recipeDetails[widget.recipe]!;

    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(recipeImages[widget.recipe]!, height: 200, fit: BoxFit.cover),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                  widget.onFavoriteToggle(widget.recipe);
                });
              },
              child: Text(isFavorite ? "Remove from Favorites" : "Add to Favorites"),
            ),
            Text("Ingredients:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(details["ingredients"]!, style: TextStyle(fontSize: 16)),
            Text("Instructions:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(details["instructions"]!, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
