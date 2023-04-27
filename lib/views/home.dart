import 'package:flutter/material.dart';
import 'package:recipeapp/model/recipe.dart';
import 'package:recipeapp/service.dart';
import 'package:recipeapp/views/detail_widget.dart';
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
          future: Services.futureData,
          builder: (context, AsyncSnapshot<RecipeList> snapshot) {
            if (snapshot.hasData) {
              RecipeList? recipe = snapshot.data;
              return ListView.builder(
                itemCount: recipe?.recipes?.length,
                itemBuilder: (context, index) {
                  Recipe selectedRecipe = recipe!.recipes![index];
                  return RecipeCard(
                      callback: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailWidget(
                              recipe: selectedRecipe,
                            ),
                          ),
                        );
                      },
                      title: recipe.recipes?[index].title ?? '',
                      cookTime:
                          recipe.recipes?[index].readyInMinutes.toString() ??
                              '',
                      rating: "${recipe.recipes?[index].pricePerServing}",
                      thumbnailUrl: recipe.recipes?[index].image ?? '');
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
