import 'package:flutter/material.dart';
import 'package:learningflutterexamples/general/AppStrings.dart';

class StatefulExample extends StatefulWidget {
  @override
  _StatefulExampleState createState() => _StatefulExampleState();
}

class _StatefulExampleState extends State<StatefulExample> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.exampleTitle1),
      ),
      body: Container(
          child: Center(
        child: FlatButton(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
          splashColor: Colors.redAccent,
          onPressed: () {
            setState(() {
              i++;
            });
          },
          child: Text(
            i.toString(),
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      )),
    );
  }
}
