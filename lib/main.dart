import 'package:flutter/material.dart';
import 'category_screen.dart';

void main() {
  runApp(DailyAffirmationsApp());
}

class DailyAffirmationsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Affirmations',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CategoryScreen(),
    );
  }
}
