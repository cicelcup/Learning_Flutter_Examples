import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Field16 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderSegmentedControl(
      textStyle: Theme.of(context).textTheme.headline5,
      selectedColor: Colors.yellowAccent.shade200,
      pressedColor: Colors.blueGrey,
      validators: [FormBuilderValidators.required()],
      decoration: InputDecoration(labelText: "Movie Rating"),
      attribute: "movie_rating",
      options: List.generate(5, (i) => i + 1)
          .map((number) => FormBuilderFieldOption(value: number))
          .toList(),
    );
  }
}
