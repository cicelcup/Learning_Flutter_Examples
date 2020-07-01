import 'package:flutter/material.dart';
import 'package:learningflutterexamples/general/AppStrings.dart';

class ExampleTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.exampleTwoTitle),
      ),
      body: Text(AppStrings.exampleTwoSubTitle),
    );
  }
}
