import 'package:flutter/material.dart';
import 'package:learningflutterexamples/examples/providers/counter.dart';
import 'package:learningflutterexamples/examples/providers/provider_screen.dart';
import 'package:provider/provider.dart';

class ProviderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //definition of the provider
    return ChangeNotifierProvider(
      create: (BuildContext context) => Counter(),
      child: ProviderScreen(),
    );
  }
}
