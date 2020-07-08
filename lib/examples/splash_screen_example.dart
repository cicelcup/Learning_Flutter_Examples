import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';

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

class SplashHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Home Page"),
      ),
      body: Center(child: Text("This is a example")),
    );
  }
}
