import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Field4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderChoiceChip(
      attribute: 'favorite_ice_cream',
      decoration: InputDecoration(labelText: 'Ice Cream'),
      spacing: 8.0,
      backgroundColor: Colors.yellow,
      selectedColor: Colors.orangeAccent,
      options: [
        FormBuilderFieldOption(child: Text('Vanilla'), value: 'vanilla'),
        FormBuilderFieldOption(child: Text('Chocolate'), value: 'chocolate'),
        FormBuilderFieldOption(child: Text('Strawberry'), value: 'strawberry'),
        FormBuilderFieldOption(child: Text('Peach'), value: 'peach'),
      ],
    );
  }
}
