
import 'package:flutter/material.dart';
import 'data/affirmations.dart';

void main() {
  runApp(AffirmationsApp());
}

class AffirmationsApp extends StatefulWidget {
  @override
  _AffirmationsAppState createState() => _AffirmationsAppState();
}

class _AffirmationsAppState extends State<AffirmationsApp> {
  final Set<String> favorites = {};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Affirmations',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CategoriesPage(
        favorites: favorites,
        onToggleFavorite: _toggleFavorite,
      ),
    );
  }

  void _toggleFavorite(String affirmation) {
    setState(() {
      if (favorites.contains(affirmation)) {
        favorites.remove(affirmation);
      } else {
        favorites.add(affirmation);
      }
    });
  }
}

class CategoriesPage extends StatelessWidget {
  final Set<String> favorites;
  final Function(String) onToggleFavorite;

  CategoriesPage({required this.favorites, required this.onToggleFavorite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Affirmation Categories"),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesPage(
                    favorites: favorites,
                    onToggleFavorite: onToggleFavorite,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: AffirmationsData.affirmations.keys.map((category) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AffirmationsPage(
                    category: category,
                    favorites: favorites,
                    onToggleFavorite: onToggleFavorite,
                  ),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(12),
              child: Center(
                child: Text(category,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class AffirmationsPage extends StatelessWidget {
  final String category;
  final Set<String> favorites;
  final Function(String) onToggleFavorite;

  AffirmationsPage(
      {required this.category,
      required this.favorites,
      required this.onToggleFavorite});

  @override
  Widget build(BuildContext context) {
    final affirmations = AffirmationsData.affirmations[category] ?? [];
    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: affirmations.length,
        itemBuilder: (context, index) {
          final affirmation = affirmations[index];
          final isFavorite = favorites.contains(affirmation);
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      affirmation,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                    size: 40,
                  ),
                  onPressed: () => onToggleFavorite(affirmation),
                ),
                SizedBox(height: 40),
              ],
            ),
          );
        },
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  final Set<String> favorites;
  final Function(String) onToggleFavorite;

  FavoritesPage({required this.favorites, required this.onToggleFavorite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorites")),
      body: favorites.isEmpty
          ? Center(child: Text("No favorites yet"))
          : ListView(
              children: favorites.map((affirmation) {
                return ListTile(
                  title: Text(affirmation),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => onToggleFavorite(affirmation),
                  ),
                );
              }).toList(),
            ),
    );
  }
}
