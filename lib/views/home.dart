import 'package:flutter/material.dart';
import 'package:recipeapp/model/recipe.dart';
import 'package:recipeapp/service.dart';
import 'package:recipeapp/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text('Food Recipe')
            ],
          ),
        ),
        body: FutureBuilder(
          future: RecipeApi.getRecipe(),
          builder: (context, AsyncSnapshot<List<Recipe>> snapshot) {
            if (snapshot.hasData) {
              List<Recipe>? recipes = snapshot.data;
              return ListView.builder(
                itemCount: recipes?.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: recipes?[index].name ?? '',
                      cookTime: recipes?[index].totalTime ?? '',
                      rating: recipes?[index].rating.toString() ?? '',
                      thumbnailUrl: recipes?[index].images ?? '');
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
