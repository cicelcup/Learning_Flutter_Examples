import 'package:flutter/material.dart';
import 'package:learningflutterexamples/examples/physics_animation/draggable_card.dart';
import 'package:learningflutterexamples/general/app_strings.dart';

class PhysicsSimulationExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.exampleTitle17),
      ),
      body: DraggableCard(
        child: FlutterLogo(
          size: 128.0,
        ),
      ),
    );
  }
}
