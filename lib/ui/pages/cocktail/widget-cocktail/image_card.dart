import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({required this.imageUrl, super.key});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      shadowColor: Colors.black45,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image.network(
          imageUrl,
          height: 250,
          width: 180,
          fit: BoxFit.cover,
        ),
      ),
    );
  
  }
}

  