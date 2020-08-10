import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Field20 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      attribute: "age",
      decoration: InputDecoration(labelText: "Age"),
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.numeric(),
        FormBuilderValidators.max(70,
            errorText: "La edad tiene que ser menor de 70"),
      ],
    );
  }
}
