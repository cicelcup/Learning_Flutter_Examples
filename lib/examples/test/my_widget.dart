import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyWidget());

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: ChangeNotifierProvider(
          create: (_) => TestProvider(),
          child: SizedBox(
            width: double.infinity,
            child: Align(child: Text('Test Provider')),
          ),
          builder: (context, child) {
            var _provider = Provider.of<TestProvider>(context);
            return Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                child,
                Text(
                  '${_provider.counter}',
                  key: Key('counter'),
                ),
                RaisedButton(
                  key: Key('increment'),
                  child: Text('Add'),
                  onPressed: () => _provider.increment(),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class TestProvider extends ChangeNotifier {
  var counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }
}
