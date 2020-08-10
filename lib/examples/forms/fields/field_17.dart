import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Field17 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderSignaturePad(
      backgroundColor: Colors.white70,
      clearButtonText: "Clear",
      penColor: Colors.redAccent,
      decoration: InputDecoration(labelText: "Signature"),
      attribute: "signature",
      height: 150,
    );
  }
}
