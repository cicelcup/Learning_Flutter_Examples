import 'package:flutter/material.dart';

//Action Icon Widget
class ActionIconExample extends StatefulWidget {
  @override
  _ActionIconState createState() => _ActionIconState();
}

class _ActionIconState extends State<ActionIconExample>
    with SingleTickerProviderStateMixin {
  //Animated controller to define the animation
  AnimationController _animatedController;
  bool firstStage = false;

  //Method at the beginning of the widget
  @override
  void initState() {
    super.initState();
    //Initiate the controller
    _animatedController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    super.dispose();
    //Dispose the controller
    _animatedController.dispose();
  }

  void tapIcon() {
    setState(() {
      firstStage = !firstStage;
      firstStage
          ? _animatedController.forward()
          : _animatedController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Action Icon'),
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            tapIcon();
          },
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _animatedController,
          ),
        ),
      ),
    );
  }
}
