import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({required this.imageUrl, required this.title, required this.subtitle, super.key});
  
  final String imageUrl;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) => Card(
    elevation: 3,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ), 
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ), 
          ),
        ],
      ),
    ),
  );
}