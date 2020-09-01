import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Field2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckboxGroup(
      decoration: InputDecoration(labelText: 'Languages'),
      attribute: 'languages',
      initialValue: ['Dart'],
      options: [
        FormBuilderFieldOption(value: 'Dart'),
        FormBuilderFieldOption(value: 'Kotlin'),
        FormBuilderFieldOption(value: 'Java'),
        FormBuilderFieldOption(value: 'Swift'),
        FormBuilderFieldOption(value: 'Objective-C'),
      ],
    );
  }
}
