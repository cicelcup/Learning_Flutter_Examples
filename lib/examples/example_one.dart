import 'package:flutter/material.dart';
import 'package:learningflutterexamples/general/AppStrings.dart';

class ExampleOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.exampleOneTitle),
      ),
      body: Text(AppStrings.exampleOneSubTitle),
    );
  }
}
