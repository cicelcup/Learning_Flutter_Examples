import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:learningflutterexamples/examples/splash/splash_home_page.dart';

class SplashScreenExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: SplashScreen.navigate(
        name: 'assets/intro.flr',
        next: (context) => SplashHomePage(),
        until: () => Future.delayed(Duration(milliseconds: 300)),
        startAnimation: '1',
      ),
    );
  }
}
