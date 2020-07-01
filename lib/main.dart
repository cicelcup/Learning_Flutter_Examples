import 'package:flutter/material.dart';
import 'package:learningflutterexamples/general/AppStrings.dart';
import 'examples/example_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: ExamplesListScreen(),
    );
  }
}
