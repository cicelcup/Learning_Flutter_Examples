import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:learningflutterexamples/examples/forms/form_screen_example.dart';

class Field22 extends StatelessWidget {
  final contacts = [
    "Jorge Augusto",
    "JAPM",
    "Jorge Peroza",
    "Jorge A Peroza M"
  ];
  @override
  Widget build(BuildContext context) {
    return FormBuilderTypeAhead(
      decoration: const InputDecoration(labelText: 'Contacts'),
      attribute: 'contacts_type_ahead',
      direction: AxisDirection.up,
      onChanged: onChanged,
      itemBuilder: (_, contact) => ListTile(
          title: Text(contact, style: Theme.of(context).textTheme.subtitle1)),
      controller: TextEditingController(text: ''),
      initialValue: 'Jorge',
      suggestionsCallback: (query) {
        if (query.isNotEmpty) {
          var lowercaseQuery = query.toLowerCase();
          return contacts.where((contact) {
            return contact.toLowerCase().contains(lowercaseQuery);
          }).toList(growable: false)
            ..sort((a, b) => a
                .toLowerCase()
                .indexOf(lowercaseQuery)
                .compareTo(b.toLowerCase().indexOf(lowercaseQuery)));
        } else {
          return contacts;
        }
      },
    );
  }
}
