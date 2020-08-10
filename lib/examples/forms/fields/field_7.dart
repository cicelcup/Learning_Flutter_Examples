import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:learningflutterexamples/examples/forms/form_screen_example.dart';
import 'package:intl/intl.dart';

class Field7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormBuilderDateRangePicker(
      attribute: 'date_range',
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      initialFirstDate: DateTime.now().subtract(Duration(days: 10)),
      initialLastDate: DateTime.now().subtract(Duration(seconds: 10)),
      validators: [FormBuilderValidators.required()],
      format: DateFormat('yyyy-MM-dd'),
      onChanged: onChanged,
      decoration: const InputDecoration(labelText: 'Date Range'),
    );
  }
}
