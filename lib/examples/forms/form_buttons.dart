import 'package:flutter/material.dart';

class FormButtons extends StatelessWidget {
  final _fbKey;

  const FormButtons(this._fbKey);
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: <Widget>[
        RaisedButton(
          child: Text('Submit'),
          onPressed: () {
            if (_fbKey.currentState.saveAndValidate()) {
              _fbKey.currentState.value.forEach((key, value) {
                print('key: $key / value: $value');
              });
            }
          },
        ),
        RaisedButton(
          child: Text('Reset'),
          onPressed: () {
            _fbKey.currentState.reset();
          },
        ),
      ],
    );
  }
}
