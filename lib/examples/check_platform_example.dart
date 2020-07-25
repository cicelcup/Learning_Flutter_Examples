import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CheckPlatformExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Material"),
      ),
      body: Center(
        child: Container(
            child: Theme.of(context).platform == TargetPlatform.iOS
                ? CupertinoSwitch(
                    activeColor: Colors.blue[300],
                    value: true,
                    onChanged: (bool toggled) {},
                  )
                : Switch(
                    activeColor: Colors.blue[300],
                    value: true,
                    onChanged: (bool toggled) {},
                  )),
      ),
    );
  }
}
