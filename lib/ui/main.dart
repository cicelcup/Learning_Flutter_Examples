import 'package:flutter/material.dart';
import 'package:learningflutterexamples/general/app_strings.dart';
import 'package:learningflutterexamples/general/app_theme.dart';
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
      theme: appTheme,
      home: ExamplesListScreen(),
    );
  }
}
