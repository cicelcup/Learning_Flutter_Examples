import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:learningflutterexamples/examples/forms/form_screen_example.dart';

class Field11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderImagePicker(
      attribute: 'images',
      decoration: const InputDecoration(
        labelText: 'Images',
      ),
      maxImages: 3,
      iconColor: Colors.amber,
      imageHeight: 100.0,
      imageWidth: 100.0,

      imageMargin: EdgeInsets.all(8.0),
      cameraLabel: Text("Open Camera"),
      // readOnly: true,
      validators: [
        FormBuilderValidators.required(
            errorText: "You should choose one image"),
        (images) {
          if (images.length < 2) {
            return 'Two images required.';
          }
          return null;
        }
      ],
      onChanged: onChanged,
    );
  }
}
