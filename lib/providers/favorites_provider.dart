import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<String> _favorites = [];

  List<String> get favorites => _favorites;

  void addFavorite(String affirmation) {
    if (!_favorites.contains(affirmation)) {
      _favorites.add(affirmation);
      notifyListeners();
    }
  }

  void removeFavorite(String affirmation) {
    _favorites.remove(affirmation);
    notifyListeners();
  }
}
