import 'package:flutter/material.dart';
import 'package:flutter_http_fetch_data/API/api_res.dart';

class CoctailDetailsScreen extends StatelessWidget {
  const CoctailDetailsScreen({required this.idDrink, super.key});
  final String idDrink;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cocktail Detail'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Details'),
              Tab(text: 'Feedback'),
            ], 
          ),
        ),
        body: FutureBuilder(
          future: fetchCocktailsDetails(idDrink), 
          builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot){
            if (snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error loading cocktail details'),
              );
            } else {
              final drinkDetails = snapshot.data!;

              return TabBarView(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.network(drinkDetails['strDrinkThumb'], height: 200),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Name: ${drinkDetails['strDrink']}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),   
                        ),
                        const SizedBox(height: 16,),
                        Text(
                          'Description: ${drinkDetails['strDrink']}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Alcohol: ${drinkDetails['strAlcoholic'] ?? "Unknown"}',
                          style: const TextStyle(
                            fontSize: 16
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Ingredients:',
                          style: TextStyle(
                            fontSize: 16, 
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ... _buildIngredients(drinkDetails),
                        const SizedBox(height: 16),
                        Text(
                          'Glass: ${drinkDetails['strGlass']}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                      
                    ),
                  ),
                  const SingleChildScrollView(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'Please select your feedback: ',
                              style: TextStyle(
                                fontSize: 18, 
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 16),
                            FeedbackSelection(),
                          ],
                        ),
                      )
                ] 
              );
            }
          }
        ),
      ),
    );
  }





  List<Widget> _buildIngredients(Map<String, dynamic> drink){
    List<Widget> ingredientWidgets = [];
    for (int i=1; i<=15; i++) {
      var ingredientKey = 'strIngredient$i';
      if (drink[ingredientKey] != null && drink[ingredientKey].isNotEmpty) {
        ingredientWidgets.add(Text(
          drink[ingredientKey],
          style: const TextStyle(fontSize: 16),
        ));
      }
    }
    return ingredientWidgets;
  }
}


class FeedbackSelection extends StatefulWidget {
  const FeedbackSelection({super.key});

  @override
  State<FeedbackSelection> createState() => _FeedbackSelectionState();
}

class _FeedbackSelectionState extends State<FeedbackSelection> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}