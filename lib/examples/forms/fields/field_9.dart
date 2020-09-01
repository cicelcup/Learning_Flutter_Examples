import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Field9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown(
      attribute: 'gender',
      decoration: InputDecoration(labelText: 'Gender'),
      // initialValue: 'Male',
      hint: Text('Select Gender'),
      validators: [FormBuilderValidators.required()],
      items: ['Male', 'Female', 'Other'].map((gender) =>
          // ignore: prefer_single_quotes
          DropdownMenuItem(value: gender, child: Text("$gender"))).toList(),
    );
  }
}
