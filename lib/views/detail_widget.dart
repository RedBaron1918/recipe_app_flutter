import 'package:flutter/material.dart';
import 'package:recipeapp/model/recipe.dart';
import 'package:recipeapp/widgets/recipe_card.dart';

class DetailWidget extends StatelessWidget {
  final Recipe recipe;
  const DetailWidget({required this.recipe, super.key});
  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${recipe.title}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          RecipeCard(
              callback: () {},
              title: recipe.title ?? '',
              cookTime: recipe.readyInMinutes.toString(),
              rating: "${recipe.pricePerServing}",
              thumbnailUrl: recipe.image ?? ''),
          Text(
            removeAllHtmlTags(recipe.instructions ?? ''),
            style: const TextStyle(color: Colors.black),
          )
        ]),
      ),
    );
  }
}
