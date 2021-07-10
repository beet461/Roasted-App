import 'package:flutter/material.dart';
import 'package:roasted/page/page.dart' as page;

// Start of app, class MyApp
void main() {
  runApp(MyApp());
}

// MyApp is the entire app, its contents are determined by Page class
class MyApp extends StatelessWidget {
  final theme = new ThemeData(scaffoldBackgroundColor: const Color(0xFF080808));
  // This widget is the root of the application.
  // In build() the theme is set to theme (above), title is 'Roasted!' and the content is Page()
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'Roasted!',
      home: page.Page(),
    );
  }
}
