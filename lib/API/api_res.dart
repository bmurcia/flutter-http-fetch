import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> fetchCoctails() async {
  final url = 
      Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail');
  final response = await http.get(url); 

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return data['drinks'];
  } else {
    throw Exception('Failed to load cocktails');
  }
}

Future<List<dynamic>> fetchCoctailsDrinksA() async {
  final url = Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return data['drinks'];
  } else {
    throw Exception('Failed to load alcoholic cocktails');
  }
}

Future<List<dynamic>> fetchCoctailsDrinksNA() async {
  final url = Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return data['drinks'];
  } else {
    throw Exception('Failed to load Non alcoholic cocktails');
  }
}

Future<Map<String, dynamic>> fetchCocktailsDetails(String idDrink) async {
  final response = await http.get(Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$idDrink'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['drinks'][0];
  } else {
    throw Exception('Failed to load cocktail details');
  }
}