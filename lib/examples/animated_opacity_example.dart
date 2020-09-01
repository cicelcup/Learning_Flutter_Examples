import 'package:flutter/material.dart';
import 'package:learningflutterexamples/general/app_strings.dart';
import 'package:provider/provider.dart';

class AnimatedOpacityExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OpacityProvider>(
        create: (_) => OpacityProvider(),
        builder: (context, _) {
          var _provider = context.watch<OpacityProvider>(); //Provider
          var _isOpaque = _provider.isOpaque; //Var to control the opacity
          return Scaffold(
            appBar: AppBar(
              title: Text(AppStrings.exampleTitle19),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _provider.changeOpacity, //Change container opacity.
              child: Icon(Icons.flip),
            ),
            body: Center(
              child: AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: _isOpaque ? 0.3 : 1.0,
                child: Container(
                  color: Theme.of(context).primaryColor,
                  width: 150.0,
                  height: 150.0,
                  child: Center(
                    child: Text(
                      '$_isOpaque',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

//Provider to control the state of the container opacity
class OpacityProvider extends ChangeNotifier {
  var isOpaque = false;

  void changeOpacity() {
    isOpaque = !isOpaque;
    notifyListeners();
  }
}
