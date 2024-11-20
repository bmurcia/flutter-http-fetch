

import 'package:flutter/material.dart';
import 'package:flutter_http_fetch_data/domain/models/coctail_model.dart';
import 'package:flutter_http_fetch_data/domain/service/coctail_services.dart';
import 'package:flutter_http_fetch_data/ui/pages/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome the Coctail App'),
      ),
      body: Center(
        child: FutureBuilder(
          future: CoctailServices().getAllCoctails(), 
          builder:(context, snapshot) {
            final List<Coctail>? drinks = snapshot.data;
            if( drinks != null ){
              final List<Coctail> limitedDrinks = drinks.take(10).toList();
              return ListView.builder(
                itemCount: limitedDrinks.length,
                itemBuilder: (BuildContext context,int  index) {
                  final drink =drinks[index];
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomCard(
                          imageUrl: drink.url.toString(), 
                          title: drink.name.toString(),
                        ),
                  );
                  
                },
              );
            }else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap:(value) {
          
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            label: 'List Drinks' 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search' 
          )
        ], 
      ),
    );
  }
}