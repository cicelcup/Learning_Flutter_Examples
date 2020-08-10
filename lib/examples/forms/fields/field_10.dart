import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Field10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderFilterChip(
      spacing: 8.0,
      backgroundColor: Colors.tealAccent,
      selectedColor: Colors.teal,
      checkmarkColor: Colors.pink,
      elevation: 8.0,
      attribute: "pets",
      options: [
        FormBuilderFieldOption(child: Text("Cats"), value: "cats"),
        FormBuilderFieldOption(child: Text("Dogs"), value: "dogs"),
        FormBuilderFieldOption(child: Text("Rodents"), value: "rodents"),
        FormBuilderFieldOption(child: Text("Birds"), value: "birds"),
      ],
    );
  }
}
