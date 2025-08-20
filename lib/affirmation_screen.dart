import 'package:flutter/material.dart';

class AffirmationScreen extends StatelessWidget {
  final String category;
  final List<String> affirmations;

  AffirmationScreen({required this.category, required this.affirmations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: ListView.builder(
        itemCount: affirmations.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                affirmations[index],
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }
}
