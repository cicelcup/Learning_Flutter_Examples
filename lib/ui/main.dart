import 'package:flutter/material.dart';
import 'package:learningflutterexamples/general/AppStrings.dart';
import 'example_list_screen.dart';

void main() {
  runApp(MyApp());
}

//Start of the application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        buttonTheme: ButtonThemeData(buttonColor: Colors.blue),
      ),
      home: ExamplesListScreen(),
    );
  }
}
