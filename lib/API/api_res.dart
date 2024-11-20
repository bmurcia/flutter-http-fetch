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