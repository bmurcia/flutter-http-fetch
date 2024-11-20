import 'package:flutter/material.dart';
import 'package:flutter_http_fetch_data/ui/pages/home/home_page.dart';
import 'package:flutter_http_fetch_data/ui/pages/list-drinks/list-drinks_page.dart';
import 'package:flutter_http_fetch_data/ui/pages/search/search_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ListDrinksScreen(),
    const SearchPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome The Cocktail App'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap:(value) {
          setState(() {
            _currentIndex = value;
          });
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