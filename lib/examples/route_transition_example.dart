import 'package:flutter/material.dart';
import 'package:learningflutterexamples/general/app_strings.dart';

class RouteTransitionExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PageRouteBuilder _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            RouteTransitionPage2(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(1.0, 1.0); //Initial state of the screen
          var end = Offset.zero; //Final state of the screen
          var tween = Tween(begin: begin, end: end);
          var curveAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.ease,
          );

          var offsetAnimation = tween.animate(curveAnimation);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.exampleTitle16),
      ),
      body: Center(
        child: RaisedButton(
          padding: EdgeInsets.all(16.0),
          onPressed: () => Navigator.of(context).push(_createRoute()),
          child: Text(
            'Go',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class RouteTransitionPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text(
          'Second Page',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
