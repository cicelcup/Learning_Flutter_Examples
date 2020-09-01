import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learningflutterexamples/general/app_strings.dart';

class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  var _radius = 10.0;
  var _height = 150.0;
  var _width = 150.0;
  var _borderWidth = 10.0;
  Color _color = Colors.purple;
  Color _borderColor = Colors.pink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.exampleTitle18),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 32.0),
          RaisedButton(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Text(
              'Change Container',
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.white,
                  ),
            ),
            onPressed: () {
              setState(() {
                _radius = Random().nextInt(50).toDouble();
                _height = 50.0 + Random().nextInt(200).toDouble();
                _width = 50.0 + Random().nextInt(200).toDouble();
                _borderWidth = Random().nextInt(10).toDouble();
                _color = Color.fromRGBO(156, 39, 176, Random().nextDouble());
                _borderColor = Color.fromRGBO(
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255),
                  1.0,
                );
                // _y = Random().nextDouble();
                // _z = Random().nextDouble();
              });
            },
          ),
          SizedBox(
            height: 64.0,
            width: double.infinity,
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            transform: Matrix4.skewY(0.3)..rotateZ(0.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_radius),
              border: Border.all(
                color: _borderColor,
                width: _borderWidth,
              ),
              color: _color,
            ),
            height: _height,
            width: _width,
            child: FlutterLogo(),
          ),
        ],
      ),
    );
  }
}
