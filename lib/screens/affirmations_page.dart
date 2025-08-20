import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/affirmations.dart';
import '../providers/favorites_provider.dart';

class AffirmationsPage extends StatelessWidget {
  final String category;

  const AffirmationsPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final affirmations = affirmationsByCategory[category] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: ListView.builder(
        itemCount: affirmations.length,
        itemBuilder: (context, index) {
          final affirmation = affirmations[index];
          final favoritesProvider = Provider.of<FavoritesProvider>(context);
          final isFav = favoritesProvider.isFavorite(affirmation);

          return ListTile(
            title: Text(affirmation),
            trailing: IconButton(
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? Colors.red : null,
              ),
              onPressed: () {
                favoritesProvider.toggleFavorite(affirmation);
              },
            ),
          );
        },
      ),
    );
  }
}
