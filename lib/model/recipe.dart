import 'dart:convert';

RecipeList recipeListFromJson(String str) =>
    RecipeList.fromJson(json.decode(str));

String recipeListToJson(RecipeList data) => json.encode(data.toJson());

class RecipeList {
  List<Recipe>? recipes;

  RecipeList({
    this.recipes,
  });

  factory RecipeList.fromJson(Map<String, dynamic> json) => RecipeList(
        recipes: json["recipes"] == null
            ? []
            : List<Recipe>.from(
                json["recipes"]!.map((x) => Recipe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recipes": recipes == null
            ? []
            : List<dynamic>.from(recipes!.map((x) => x.toJson())),
      };
}

class Recipe {
  String? sourceName;
  double? pricePerServing;
  List<ExtendedIngredient>? extendedIngredients;
  String? title;
  int? readyInMinutes;
  String? image;
  String? instructions;
  List<AnalyzedInstruction>? analyzedInstructions;

  Recipe({
    this.sourceName,
    this.pricePerServing,
    this.extendedIngredients,
    this.title,
    this.readyInMinutes,
    this.image,
    this.instructions,
    this.analyzedInstructions,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        sourceName: json["sourceName"],
        pricePerServing: json["pricePerServing"]?.toDouble(),
        extendedIngredients: json["extendedIngredients"] == null
            ? []
            : List<ExtendedIngredient>.from(json["extendedIngredients"]!
                .map((x) => ExtendedIngredient.fromJson(x))),
        title: json["title"],
        readyInMinutes: json["readyInMinutes"],
        image: json["image"],
        instructions: json["instructions"],
        analyzedInstructions: json["analyzedInstructions"] == null
            ? []
            : List<AnalyzedInstruction>.from(json["analyzedInstructions"]!
                .map((x) => AnalyzedInstruction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sourceName": sourceName,
        "pricePerServing": pricePerServing,
        "extendedIngredients": extendedIngredients == null
            ? []
            : List<dynamic>.from(extendedIngredients!.map((x) => x.toJson())),
        "title": title,
        "readyInMinutes": readyInMinutes,
        "image": image,
        "instructions": instructions,
        "analyzedInstructions": analyzedInstructions == null
            ? []
            : List<dynamic>.from(analyzedInstructions!.map((x) => x.toJson())),
      };
}

class AnalyzedInstruction {
  String? name;
  List<Step>? steps;

  AnalyzedInstruction({
    this.name,
    this.steps,
  });

  factory AnalyzedInstruction.fromJson(Map<String, dynamic> json) =>
      AnalyzedInstruction(
        name: json["name"],
        steps: json["steps"] == null
            ? []
            : List<Step>.from(json["steps"]!.map((x) => Step.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "steps": steps == null
            ? []
            : List<dynamic>.from(steps!.map((x) => x.toJson())),
      };
}

class Step {
  String? step;

  Step({
    this.step,
  });

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        step: json["step"],
      );

  Map<String, dynamic> toJson() => {
        "step": step,
      };
}

class ExtendedIngredient {
  int? id;
  String? aisle;
  String? image;
  String? consistency;
  String? originalName;

  ExtendedIngredient({
    this.id,
    this.aisle,
    this.image,
    this.consistency,
    this.originalName,
  });

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) =>
      ExtendedIngredient(
        id: json["id"],
        aisle: json["aisle"],
        image: json["image"],
        consistency: json["consistency"],
        originalName: json["originalName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "aisle": aisle,
        "image": image,
        "consistency": consistency,
        "originalName": originalName,
      };
}
