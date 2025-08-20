import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';

class AffirmationsPage extends StatelessWidget {
  final String category;

  AffirmationsPage({required this.category});

  final Map<String, List<String>> affirmations = {
    "Love": List.generate(20, (i) => "I am worthy of love #$i"),
    "Confidence": List.generate(20, (i) => "I believe in myself #$i"),
    "Success": List.generate(20, (i) => "I achieve my goals #$i"),
    "Health": List.generate(20, (i) => "I am healthy and strong #$i"),
    "Gratitude": List.generate(20, (i) => "I am grateful for everything #$i"),
    "Motivation": List.generate(20, (i) => "I stay motivated every day #$i"),
    "Happiness": List.generate(20, (i) => "I choose happiness #$i"),
    "Calmness": List.generate(20, (i) => "I am calm and relaxed #$i"),
  };

  @override
  Widget build(BuildContext context) {
    final List<String> list = affirmations[category] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final affirmation = list[index];
          return ListTile(
            title: Text(affirmation),
            trailing: IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {
                Provider.of<FavoritesProvider>(context, listen: false)
                    .addFavorite(affirmation);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Added to Favorites ❤️")),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
