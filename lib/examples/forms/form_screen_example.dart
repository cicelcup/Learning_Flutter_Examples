import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:learningflutterexamples/examples/forms/all_form_fields.dart';
import 'package:learningflutterexamples/examples/forms/form_buttons.dart';
import 'package:learningflutterexamples/examples/forms/form_theme.dart';

final ValueChanged onChanged = (val) => print(val);

class FormScreenExample extends StatelessWidget {
  //Key of the form
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  static const _separation = SizedBox(height: 24);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Example")),
      body: Theme(
        data: getFormTheme(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FormBuilder(
            //Key of the form
            key: _fbKey,
            //Initials values already settled
            initialValue: {'date': DateTime.now(), 'accept_terms': false},
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ...getFormFields()
                      .map((item) => Column(children: [item, _separation]))
                      .toList(),
                  FormButtons(_fbKey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
