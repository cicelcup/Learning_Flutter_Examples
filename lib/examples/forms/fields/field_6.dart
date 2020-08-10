import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Field6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderCountryPicker(
      initialValue: 'Germany',
      attribute: 'country',
      cursorColor: Colors.pink,
      style: Theme.of(context).textTheme.subtitle1,
      priorityListByIsoCode: ['US'],
      valueTransformer: (value) {
        return value.isoCode;
      },
      decoration: const InputDecoration(labelText: 'Country'),
      validators: [
        FormBuilderValidators.required(errorText: 'This field required.'),
      ],
    );
  }
}
