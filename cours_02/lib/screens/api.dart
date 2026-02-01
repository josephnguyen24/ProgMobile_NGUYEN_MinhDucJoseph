import 'package:formation_flutter/model/product.dart';

class APIResponse {
  final String status;
  final APIProduct? product;

  APIResponse.fromJSON(Map<String, dynamic> json)
    : status = json['status'],
      product = json['product'] != null
          ? APIProduct.fromJSON(json['product'])
          : null;
}

class APIProduct {
  final String barcode;
  final String? name;
  final String? altName;
  final String? picture;
  final String? quantity;
  final List<String>? brands;
  final List<String>? manufacturingCountries;
  final String? nutriScore;
  final APIProductNutriScoreLevels? nutriScoreLevels;
  final int? novaScore;
  final String? greenScore;
  final List<String>? ingredients;
  final String? ingredientsWithAllergens;
  final List<String>? traces;
  final List<String>? allergens;
  final Map<String, String>? additives;
  final APINutrientLevels? nutrientLevels;
  final APINutritionFacts? nutritionFacts;
  final bool? ingredientsFromPalmOil;
  final String? containsPalmOil;
  final String? isVegan;
  final String? isVegetarian;

  APIProduct.fromJSON(Map<String, dynamic> json)
    : barcode = json['barcode'],
      name = json['name'],
      altName = json['altName'],
      picture = json['picture'],
      quantity = json['quantity'],
      brands = json['brands'] != null
          ? List<String>.from(json['brands'])
          : null,
      manufacturingCountries = json['manufacturingCountries'] != null
          ? List<String>.from(json['manufacturingCountries'])
          : null,
      nutriScore = json['nutriScore'],
      nutriScoreLevels = json['nutriScoreLevels'] != null
          ? APIProductNutriScoreLevels.fromJSON(json['nutriScoreLevels'])
          : null,
      novaScore = json['novaScore'],
      greenScore = json['greenScore'],
      ingredients = json['ingredients'] != null
          ? List<String>.from(json['ingredients'])
          : null,
      ingredientsWithAllergens = json['ingredientsWithAllergens'],
      traces = json['traces'] != null
          ? List<String>.from(json['traces'])
          : null,
      allergens = json['allergens'] != null
          ? List<String>.from(json['allergens'])
          : null,
      additives = json['additives'] != null
          ? Map<String, String>.from(json['additives'])
          : null,
      nutrientLevels = json['nutrientLevels'] != null
          ? APINutrientLevels.fromJSON(json['nutrientLevels'])
          : null,
      nutritionFacts = json['nutritionFacts'] != null
          ? APINutritionFacts.fromJSON(json['nutritionFacts'])
          : null,
      ingredientsFromPalmOil = json['ingredientsFromPalmOil'],
      containsPalmOil = json['containsPalmOil'],
      isVegan = json['isVegan'],
      isVegetarian = json['isVegetarian'];

  Product toProduct() {
    return Product(
      barcode: barcode,
      name: name,
      altName: altName,
      picture: picture,
      quantity: quantity,
      brands: brands,
      manufacturingCountries: manufacturingCountries,
      nutriScore: _parseNutriScore(nutriScore),
      nutriScoreLevels: nutriScoreLevels?.toProductNutriScoreLevels(),
      novaScore: _parseNovaScore(novaScore),
      greenScore: _parseGreenScore(greenScore),
      ingredients: ingredients,
      ingredientsWithAllergens: ingredientsWithAllergens,
      traces: traces,
      allergens: allergens,
      additives: additives,
      nutrientLevels: nutrientLevels?.toNutrientLevels(),
      nutritionFacts: nutritionFacts?.toNutritionFacts(),
      ingredientsFromPalmOil: ingredientsFromPalmOil,
      containsPalmOil: ProductAnalysis.fromString(containsPalmOil),
      isVegan: ProductAnalysis.fromString(isVegan),
      isVegetarian: ProductAnalysis.fromString(isVegetarian),
    );
  }

  ProductNutriScore? _parseNutriScore(String? score) {
    if (score == null) return null;
    return switch (score.toUpperCase()) {
      'A' => ProductNutriScore.A,
      'B' => ProductNutriScore.B,
      'C' => ProductNutriScore.C,
      'D' => ProductNutriScore.D,
      'E' => ProductNutriScore.E,
      _ => ProductNutriScore.unknown,
    };
  }

  ProductNovaScore? _parseNovaScore(int? score) {
    if (score == null) return null;
    return switch (score) {
      1 => ProductNovaScore.group1,
      2 => ProductNovaScore.group2,
      3 => ProductNovaScore.group3,
      4 => ProductNovaScore.group4,
      _ => ProductNovaScore.unknown,
    };
  }

  ProductGreenScore? _parseGreenScore(String? score) {
    if (score == null) return null;
    return switch (score.toUpperCase()) {
      'A+' => ProductGreenScore.APlus,
      'A' => ProductGreenScore.A,
      'B' => ProductGreenScore.B,
      'C' => ProductGreenScore.C,
      'D' => ProductGreenScore.D,
      'E' => ProductGreenScore.E,
      'F' => ProductGreenScore.F,
      _ => ProductGreenScore.unknown,
    };
  }
}

class APIProductNutriScoreLevels {
  final APIProductNutriScoreLevel? energy;
  final APIProductNutriScoreLevel? fiber;
  final APIProductNutriScoreLevel? fruitsVegetablesLegumes;
  final APIProductNutriScoreLevel? proteins;
  final APIProductNutriScoreLevel? salt;
  final APIProductNutriScoreLevel? saturatedFat;
  final APIProductNutriScoreLevel? sugars;

  APIProductNutriScoreLevels.fromJSON(Map<String, dynamic> json)
    : energy = json['energy'] != null
          ? APIProductNutriScoreLevel.fromJSON(json['energy'])
          : null,
      fiber = json['fiber'] != null
          ? APIProductNutriScoreLevel.fromJSON(json['fiber'])
          : null,
      fruitsVegetablesLegumes = json['fruitsVegetablesLegumes'] != null
          ? APIProductNutriScoreLevel.fromJSON(json['fruitsVegetablesLegumes'])
          : null,
      proteins = json['proteins'] != null
          ? APIProductNutriScoreLevel.fromJSON(json['proteins'])
          : null,
      salt = json['salt'] != null
          ? APIProductNutriScoreLevel.fromJSON(json['salt'])
          : null,
      saturatedFat = json['saturatedFat'] != null
          ? APIProductNutriScoreLevel.fromJSON(json['saturatedFat'])
          : null,
      sugars = json['sugars'] != null
          ? APIProductNutriScoreLevel.fromJSON(json['sugars'])
          : null;

  ProductNutriScoreLevels toProductNutriScoreLevels() {
    return ProductNutriScoreLevels(
      energy: energy?.toProductNutriScoreLevel(),
      fiber: fiber?.toProductNutriScoreLevel(),
      fruitsVegetablesLegumes: fruitsVegetablesLegumes
          ?.toProductNutriScoreLevel(),
      proteins: proteins?.toProductNutriScoreLevel(),
      salt: salt?.toProductNutriScoreLevel(),
      saturatedFat: saturatedFat?.toProductNutriScoreLevel(),
      sugars: sugars?.toProductNutriScoreLevel(),
    );
  }
}

class APIProductNutriScoreLevel {
  final double points;
  final double maxPoints;
  final String unit;
  final double value;
  final String type;

  APIProductNutriScoreLevel.fromJSON(Map<String, dynamic> json)
    : points = (json['points'] ?? 0).toDouble(),
      maxPoints = (json['maxPoints'] ?? 0).toDouble(),
      unit = json['unit'] ?? '',
      value = (json['value'] ?? 0).toDouble(),
      type = json['type'] ?? 'unknown';

  ProductNutriScoreLevel toProductNutriScoreLevel() {
    return ProductNutriScoreLevel(
      points: points,
      maxPoints: maxPoints,
      unit: unit,
      value: value,
      type: _parseType(type),
    );
  }

  ProductNutriScoreLevelType _parseType(String type) {
    return switch (type.toLowerCase()) {
      'positive' => ProductNutriScoreLevelType.positive,
      'negative' => ProductNutriScoreLevelType.negative,
      _ => ProductNutriScoreLevelType.unknown,
    };
  }
}

class APINutrientLevels {
  final String? salt;
  final String? saturatedFat;
  final String? sugars;
  final String? fat;

  APINutrientLevels.fromJSON(Map<String, dynamic> json)
    : salt = json['salt'],
      saturatedFat = json['saturatedFat'],
      sugars = json['sugars'],
      fat = json['fat'];

  NutrientLevels toNutrientLevels() {
    return NutrientLevels(
      salt: salt,
      saturatedFat: saturatedFat,
      sugars: sugars,
      fat: fat,
    );
  }
}

class APINutritionFacts {
  final String servingSize;
  final APINutriment? calories;
  final APINutriment? fat;
  final APINutriment? saturatedFat;
  final APINutriment? carbohydrate;
  final APINutriment? sugar;
  final APINutriment? fiber;
  final APINutriment? proteins;
  final APINutriment? sodium;
  final APINutriment? salt;
  final APINutriment? energy;

  APINutritionFacts.fromJSON(Map<String, dynamic> json)
    : servingSize = json['servingSize'] ?? '',
      calories = json['calories'] != null
          ? APINutriment.fromJSON(json['calories'])
          : null,
      fat = json['fat'] != null ? APINutriment.fromJSON(json['fat']) : null,
      saturatedFat = json['saturatedFat'] != null
          ? APINutriment.fromJSON(json['saturatedFat'])
          : null,
      carbohydrate = json['carbohydrate'] != null
          ? APINutriment.fromJSON(json['carbohydrate'])
          : null,
      sugar = json['sugar'] != null
          ? APINutriment.fromJSON(json['sugar'])
          : null,
      fiber = json['fiber'] != null
          ? APINutriment.fromJSON(json['fiber'])
          : null,
      proteins = json['proteins'] != null
          ? APINutriment.fromJSON(json['proteins'])
          : null,
      sodium = json['sodium'] != null
          ? APINutriment.fromJSON(json['sodium'])
          : null,
      salt = json['salt'] != null ? APINutriment.fromJSON(json['salt']) : null,
      energy = json['energy'] != null
          ? APINutriment.fromJSON(json['energy'])
          : null;

  NutritionFacts toNutritionFacts() {
    return NutritionFacts(
      servingSize: servingSize,
      calories: calories?.toNutriment(),
      fat: fat?.toNutriment(),
      saturatedFat: saturatedFat?.toNutriment(),
      carbohydrate: carbohydrate?.toNutriment(),
      sugar: sugar?.toNutriment(),
      fiber: fiber?.toNutriment(),
      proteins: proteins?.toNutriment(),
      sodium: sodium?.toNutriment(),
      salt: salt?.toNutriment(),
      energy: energy?.toNutriment(),
    );
  }
}

class APINutriment {
  final String unit;
  final dynamic perServing;
  final dynamic per100g;

  APINutriment.fromJSON(Map<String, dynamic> json)
    : unit = json['unit'] ?? '',
      perServing = json['perServing'],
      per100g = json['per100g'];

  Nutriment toNutriment() {
    return Nutriment(unit: unit, perServing: perServing, per100g: per100g);
  }
}
