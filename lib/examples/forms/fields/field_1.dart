import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Field1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckbox(
      attribute: 'accept_terms',
      label: Text(
        'I have read and agree to the terms and conditions',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      initialValue: false,
      leadingInput: true,
      activeColor: Colors.pink,
      validators: [
        FormBuilderValidators.requiredTrue(
          errorText: 'You must accept terms and conditions to continue',
        ),
      ],
    );
  }
}
