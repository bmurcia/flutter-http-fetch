import 'package:flutter/material.dart';
import 'package:flutter_http_fetch_data/ui/pages/index.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({required this.category, required this.subcategory, super.key});
  
  
  final String category;
  final String subcategory;

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(category),
                Paragraph(subcategory),
              ],
            )
          )

        ],
      ), 
    ),

  );
}