import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Field15 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderRate(
      filledColor: Colors.lime,
      emptyColor: Colors.grey,
      emptyIcon: Icons.fastfood,
      decoration: InputDecoration(labelText: 'Rate this form'),
      attribute: 'rate',
      iconSize: 32.0,
      initialValue: 3,
      max: 5,
    );
  }
}
