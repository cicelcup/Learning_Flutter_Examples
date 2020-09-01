import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:learningflutterexamples/examples/forms/form_screen_example.dart';

class Field3 extends StatelessWidget {
  final contacts = [
    'Jorge Augusto',
    'JAPM',
    'Jorge Peroza',
    'Jorge A Peroza M'
  ];

  @override
  Widget build(BuildContext context) {
    return FormBuilderChipsInput(
      attribute: 'chips_test',
      decoration: const InputDecoration(labelText: 'Chips'),
      onChanged: onChanged,
      initialValue: ['JAPM'],
      maxChips: 5,
      keyboardAppearance: Brightness.dark,
      findSuggestions: (String query) {
        if (query.isNotEmpty) {
          return contacts.where((contact) {
            return contact.toLowerCase().contains(query.toLowerCase());
          }).toList()
            ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
        } else {
          return const <String>[];
        }
      },
      chipBuilder: (context, state, contact) {
        return InputChip(
          backgroundColor: Colors.greenAccent,
          deleteIconColor: Colors.blueGrey,
          key: ObjectKey(contact),
          label: Text(contact),
          avatar: CircleAvatar(),
          onDeleted: () => state.deleteChip(contact),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
      },
      suggestionBuilder: (context, state, contact) {
        return ListTile(
          key: ObjectKey(contact),
          leading: CircleAvatar(),
          title: Text(contact),
          onTap: () => state.selectSuggestion(contact),
        );
      },
    );
  }
}
