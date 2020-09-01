import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Field18 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderSlider(
      attribute: 'slider',
      validators: [FormBuilderValidators.min(6)],
      min: 0.0,
      max: 10.0,
      initialValue: 1.0,
      divisions: 10,
      decoration: InputDecoration(labelText: 'Number of things'),
    );
  }
}
