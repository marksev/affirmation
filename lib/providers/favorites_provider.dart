import 'package:flutter/material.dart';

class FavoritesProvider with ChangeNotifier {
  final List<String> _favorites = [];

  List<String> get favorites => _favorites;

  void toggleFavorite(String affirmation) {
    if (_favorites.contains(affirmation)) {
      _favorites.remove(affirmation);
    } else {
      _favorites.add(affirmation);
    }
    notifyListeners();
  }

  bool isFavorite(String affirmation) {
    return _favorites.contains(affirmation);
  }
}
