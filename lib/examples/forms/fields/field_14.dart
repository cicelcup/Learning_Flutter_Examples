import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:learningflutterexamples/examples/forms/form_screen_example.dart';

class Field14 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderRangeSlider(
      attribute: 'range_slider',
      onChanged: onChanged,
      min: 0.0,
      max: 10.0,
      initialValue: RangeValues(4, 7),
      divisions: 10,
      activeColor: Colors.red,
      inactiveColor: Colors.pink[100],
      decoration: const InputDecoration(labelText: 'Price Range'),
      displayValues: DisplayValues.current,
    );
  }
}
