import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';

class FavoritesPage extends StatelessWidget {
  static const routeName = "/favorites";

  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),
      body: ListView.builder(
        itemCount: favoritesProvider.favorites.length,
        itemBuilder: (context, index) {
          final affirmation = favoritesProvider.favorites[index];
          return Dismissible(
            key: Key(affirmation),
            background: Container(color: Colors.red),
            onDismissed: (_) {
              favoritesProvider.toggleFavorite(affirmation);
            },
            child: ListTile(
              title: Text(affirmation),
              trailing: const Icon(Icons.delete, color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
