import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';

class AutoCompleteExample extends StatefulWidget {
  @override
  _AutoCompleteExampleState createState() => new _AutoCompleteExampleState();
}

class _AutoCompleteExampleState extends State<AutoCompleteExample> {
  List<String> added = [];
  List<String> suggestions = [
    "Apple",
    "Armidillo",
    "Actual",
    "Actuary",
    "America",
    "Argentina",
    "Australia",
    "Antarctica",
    "Blueberry",
    "Cheese",
    "Danish",
    "Eclair",
    "Fudge",
    "Granola",
    "Hazelnut",
    "Ice Cream",
    "Jely",
    "Kiwi Fruit",
    "Lamb",
    "Macadamia",
    "Nachos",
    "Oatmeal",
    "Palm Oil",
    "Quail",
    "Rabbit",
    "Salad",
    "T-Bone Steak",
    "Urid Dal",
    "Vanilla",
    "Waffles",
    "Yam",
    "Zest"
  ];
  String currentText = "";
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();

  _AutoCompleteExampleState() {
    textField = AutoCompleteTextField(
      key: key,
      suggestions: suggestions,
      itemFilter: (suggestion, String query) {
        String x = suggestion;
        return x.toLowerCase().contains(query.toLowerCase());
      },
      textChanged: (data) {
        print("JAPM $data");
      },
      textSubmitted: (data) {
        print("Entre aqui $data");
      },
      decoration: new InputDecoration(
        prefixIcon: new Icon(Icons.search),
      ),
      itemSubmitted: (data) {
        print(data);
      },
      clearOnSubmit: false,
      itemBuilder: (_, suggestion) {
        return Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(suggestion),
        );
      },
      itemSorter: (a, b) {
        return a.length.compareTo(b.length);
      },
      suggestionsAmount: 10,
    );
  }

  AutoCompleteTextField textField;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('AutoComplete TextField'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: textField,
        ));
  }
}
