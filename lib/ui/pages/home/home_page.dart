

import 'package:flutter/material.dart';
import 'package:flutter_http_fetch_data/API/api_res.dart';
import 'package:flutter_http_fetch_data/ui/pages/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coctail Home'),
      ),
      body: FutureBuilder(     
          future: fetchCoctails(), 
          builder:(context, snapshot) {
            if( snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator()
              );
            }else if (snapshot.hasError) {
              return const Center(
                child: Text('Error fetching coctails.')
              );
            } else {
              final drinks = snapshot.data as List<dynamic>;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.8,
                ),
                padding: const EdgeInsets.all(8.0),
                itemCount: drinks.length,
                itemBuilder: (context, index) {
                  final drink = drinks[index];
                  return CustomCard(
                    imageUrl: drink['strDrinkThumb'], 
                    title: drink['strDrink'],
                  );
                },
              );
            }
          },
        ),
      
    );
  }
}