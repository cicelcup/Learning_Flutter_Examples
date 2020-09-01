import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Field21 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTouchSpin(
      iconActiveColor: Colors.deepOrange,
      textStyle: Theme.of(context).textTheme.headline5,
      decoration: InputDecoration(labelText: 'Stepper'),
      attribute: 'stepper',
      initialValue: 10,
      max: 15,
      step: 1,
    );
  }
}
