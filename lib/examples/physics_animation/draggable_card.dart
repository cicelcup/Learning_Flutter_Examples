import 'package:flutter/material.dart';

class DraggableCard extends StatefulWidget {
  final child;

  const DraggableCard({@required this.child});

  @override
  _DraggableCardState createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with TickerProviderStateMixin {
  //Set the alignment to place the object
  Alignment _dragAlignment = Alignment.center;
  //controller of the animation
  AnimationController _controller;

  //Animation for the alignment
  Animation<Alignment> _animation;

  void _runAnimation() {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );
    _controller.reset();
    _controller.forward();
  }

  @override
  void initState() {
    //Set the animation controller
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    //set the listener for the controller
    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    //dispose the animation controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //size of the screen to perform the drag operation
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onPanDown: (details) => _controller.stop(),
      onPanUpdate: (details) {
        setState(() {
          _dragAlignment += Alignment(
            details.delta.dx / (size.width / 2),
            details.delta.dy / (size.height / 2),
          );
        });
      },
      onPanEnd: (details) => _runAnimation(),
      child: Align(
        alignment: _dragAlignment,
        child: Card(
          elevation: 10.0,
          shadowColor: Colors.indigo,
          child: widget.child,
        ),
      ),
    );
  }
}
