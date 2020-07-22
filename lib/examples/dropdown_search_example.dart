import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class DropDownSearchExample extends StatelessWidget {
  final List<String> suggestions = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DropDown Search Example"),
      ),
      body: Center(
        child: DropdownSearch<String>(
          popupTitle: Text("Opciones"),
          onChanged: print,
          mode: Mode.BOTTOM_SHEET,
          items: suggestions,
          label: "Proyecto",
          hint: "Escoger alguna opción",
          showSearchBox: true,
          autoFocusSearchBox: true,
        ),
      ),
    );
  }
}
