import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:learningflutterexamples/examples/forms/form_screen_example.dart';

class Field13 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderRadioGroup(
      attribute: 'radio_group',
      activeColor: Colors.purple,
      decoration: const InputDecoration(labelText: 'Radio Group'),
      onChanged: onChanged,
      options: [
        FormBuilderFieldOption(value: 'M', child: Text('Male')),
        FormBuilderFieldOption(value: 'F', child: Text('Female')),
      ],
    );
  }
}
