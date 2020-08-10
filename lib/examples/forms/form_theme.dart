import 'package:flutter/material.dart';

ThemeData getFormTheme() {
  const _border = BorderRadius.all(Radius.circular(16.0));
  return ThemeData(
    buttonTheme: ButtonThemeData(buttonColor: Colors.blue),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: Colors.pink,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: _border,
        borderSide: BorderSide(color: Colors.amber, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: _border,
        borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: _border,
        borderSide: BorderSide(color: Colors.green, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: _border,
        borderSide: BorderSide(color: Colors.red[900], width: 2.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: _border,
        borderSide: BorderSide(color: Colors.red[900], width: 2.0),
      ),
    ),
    textTheme: TextTheme(
      subtitle1: TextStyle(color: Colors.indigo),
      subtitle2: TextStyle(color: Colors.white),
      headline5:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.deepOrange),
    ),
  );
}
