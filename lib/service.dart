import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipeapp/model/recipe.dart';

const apiKey = 'aac424d1e85c48af9d27a803c993c25c';

class Services {
  static Future<RecipeList> getRecipe(String productUrl) async {
    final response = await http.get(Uri.parse(productUrl));
    if (response.statusCode == 200 || response.statusCode == 304) {
      final decodedResponse = jsonDecode(response.body);

      final productList = RecipeList.fromJson(decodedResponse);
      return productList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  static Future<RecipeList> futureData = Future<RecipeList>(() =>
      Services.getRecipe(
          "https://api.spoonacular.com/recipes/random?apiKey=$apiKey&number=10"));
}
