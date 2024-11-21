import 'package:flutter/material.dart';
import 'package:flutter_http_fetch_data/API/api_res.dart';
import 'package:flutter_http_fetch_data/ui/pages/cocktail/coctail_page.dart';

class ListDrinksScreen extends StatelessWidget {
  const ListDrinksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Drinks'),
      ),
      body: FutureBuilder(
        future: Future.wait([
          fetchCoctailsDrinksA(),
          fetchCoctailsDrinksNA()
        ]), 
        builder: (context, AsyncSnapshot<List<List<dynamic>>> snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error loading drinks'),
            );
          }else {
            final alcoholicDrinks = snapshot.data![0];
            final nonAlcoholicDrinks = snapshot.data![1];

            return ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        'Alcoholic Drinks',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...alcoholicDrinks.asMap().entries.map((entry){
                        final index = entry.key +1;
                        final drink = entry.value;
                        final idDrink = drink['idDrink'];

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CoctailDetailsScreen(idDrink: idDrink),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Text('$index.'),
                              title: Text(drink['strDrink']),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF7FB3D5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Non-Alcoholic Drinks',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ... nonAlcoholicDrinks.asMap().entries.map((entry){
                        final index = entry.key + 1;
                        final drink = entry.value;
                        final idDrink = drink['idDrink'];

                        return InkWell(
                          onTap: (){
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context) => CoctailDetailsScreen(idDrink: idDrink), 
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Text('$index'),
                              title: Text(drink['strDrink']),
                            ),
                          ),
                          
                        );
                      })
                    ],
                  ),
                )

              ],
            );
          }
        }
      ),
    );
  }
}