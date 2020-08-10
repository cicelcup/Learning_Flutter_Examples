import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Field5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderColorPicker(
      textAlign: TextAlign.center,
      attribute: 'color_picker',
      initialValue: Colors.lightGreenAccent,
      colorPickerType: ColorPickerType.MaterialPicker,
      decoration: const InputDecoration(
        suffixIconConstraints: BoxConstraints(minHeight: 0.0),
        contentPadding: EdgeInsets.all(24.0),
        labelText: 'Pick Color',
      ),
    );
  }
}
