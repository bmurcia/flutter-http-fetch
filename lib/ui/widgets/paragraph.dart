import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {
  const Paragraph(this.content, {super.key});
  final String content;
  
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    child: Text(
      content,
      style: const TextStyle(fontSize: 18),
    ), 
  );
}
