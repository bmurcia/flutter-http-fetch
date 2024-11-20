import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_http_fetch_data/domain/models/coctail_model.dart';

class CoctailRepository {
  
//READ
  Future<List<Coctail>> getAllCoctails() async {
      final url = Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic');
      final response = await http.get(url);
      
      if (response.statusCode == 200){
        final data = json.decode(response.body);
        final drinks = data['drinks'] as List;
        return drinks.map((drink) => Coctail.fromJson(drink)).toList();
      } else {
        throw Exception("Failed to load cocktails: ${response.reasonPhrase}");
      }
    }

}