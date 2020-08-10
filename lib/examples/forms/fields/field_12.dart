import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:learningflutterexamples/examples/forms/form_screen_example.dart';

class Field12 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderPhoneField(
      attribute: 'phone_number',
      cursorColor: Colors.black,
      style: Theme.of(context).textTheme.subtitle1,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Phone Number',
      ),
      onChanged: onChanged,
      priorityListByIsoCode: ['US'],
      validators: [
        FormBuilderValidators.numeric(errorText: 'Invalid phone number'),
        FormBuilderValidators.required(errorText: 'This field reqired')
      ],
    );
  }
}
