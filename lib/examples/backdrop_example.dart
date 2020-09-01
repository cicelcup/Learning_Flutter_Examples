import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:learningflutterexamples/general/app_strings.dart';

//Use of backdrop package
class BackDropExample extends StatefulWidget {
  @override
  _BackDropExampleState createState() => _BackDropExampleState();
}

class _BackDropExampleState extends State<BackDropExample> {
  //Amount of layer to show
  static const lengthOfLayers = 10;
  //index of the current front layer
  int _currentIndex = 0;

  //List of widgets that can be show in the front layer
  final List<Widget> _frontLayers = [
    for (var i = 1; i < lengthOfLayers; i++)
      Center(
        child: Text(
          '${AppStrings.frontLayerLabel} $i',
          style: TextStyle(
            color: Colors.orange,
            fontSize: 24.0,
          ),
        ),
      ),
  ];

  //List of the widgets show in the back layer
  final List<Widget> _listTitles = [
    for (var i = 1; i < lengthOfLayers; i++)
      ListTile(
        leading: Icon(
          Icons.assignment,
          color: Colors.white,
        ),
        title: Text(
          '${AppStrings.frontLayerLabel} $i',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
  ];

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      appBar: BackdropAppBar(
        title: Text(AppStrings.exampleTitle2),
      ),
      frontLayer: _frontLayers[_currentIndex],
      headerHeight: 50.0,
      backLayer: Theme(
        data: Theme.of(context).copyWith(
          highlightColor: Colors.orangeAccent,
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: 50.0),
          child: BackdropNavigationBackLayer(
            items: <Widget>[for (var titles in _listTitles) titles],
            onTap: (int position) {
              setState(() {
                _currentIndex = position;
              });
            },
          ),
        ),
      ),
    );
  }
}
