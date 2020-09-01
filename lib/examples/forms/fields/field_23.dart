import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Field23 extends StatelessWidget {
  final options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return FormBuilderCustomField(
      attribute: 'name',
      validators: [
        FormBuilderValidators.required(errorText: 'Prueba de error')
      ],
      formField: FormField(
        enabled: true,
        builder: (FormFieldState<dynamic> field) {
          return InputDecorator(
            decoration: InputDecoration(
                labelText: 'Select option', errorText: field.errorText),
            child: Container(
              height: 100,
              child: CupertinoPicker(
                itemExtent: 40,
                children: options.map((c) => Text(c)).toList(),
                onSelectedItemChanged: (index) {
                  field.didChange(options[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
