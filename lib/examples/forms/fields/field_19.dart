import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Field19 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderSwitch(
      label: Text('I Accept the tems and conditions'),
      attribute: 'accept_terms_switch',
      initialValue: true,
    );
  }
}
