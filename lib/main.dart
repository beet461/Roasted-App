import 'package:flutter/material.dart';
import 'package:roasted/page/page.dart' as page;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final theme = new ThemeData(scaffoldBackgroundColor: const Color(0xFF080808));
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'Roasted!',
      home: page.Page(),
    );
  }
}
