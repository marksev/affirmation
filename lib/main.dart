import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/favorites_provider.dart';
import 'screens/categories_page.dart';
import 'screens/favorites_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FavoritesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Daily Affirmations',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const CategoriesPage(),
        routes: {
          FavoritesPage.routeName: (context) => const FavoritesPage(),
        },
      ),
    );
  }
}
