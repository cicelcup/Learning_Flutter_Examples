import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class Field8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      resetIcon: null,
      autovalidate: false,
      attribute: 'date',
      inputType: InputType.date,
      format: DateFormat('yyyy-MM-dd'),
      decoration: InputDecoration(labelText: 'Appointment Day'),
    );
  }
}
