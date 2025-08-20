import 'package:flutter/material.dart';
import 'affirmation_screen.dart';
import 'data/affirmations.dart';

class CategoryScreen extends StatelessWidget {
  final List<String> categories = affirmations.keys.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daily Affirmations")),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(categories[index]),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AffirmationScreen(
                      category: categories[index],
                      affirmations: affirmations[categories[index]] ?? [],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
