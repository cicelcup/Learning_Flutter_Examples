import 'package:flutter/material.dart';

class FutureStreamExample extends StatefulWidget {
  @override
  _FutureStreamExampleState createState() => _FutureStreamExampleState();
}

class _FutureStreamExampleState extends State<FutureStreamExample> {
  int _count = 0; // used by StreamBuilder

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Future and Stream Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildFutureBuilder(),
          SizedBox(height: 100),
          _buildStreamBuilder(),
        ],
      ),
    );
  }

  // constructing FutureBuilder
  Widget _buildFutureBuilder() {
    return Center(
      child: FutureBuilder<int>(
        future: _calculateSquare(10),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Text('Square = ${snapshot.data}');
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }

  // used by FutureBuilder
  Future<int> _calculateSquare(int num) async {
    await Future.delayed(Duration(seconds: 5));
    return num * num;
  }

  // constructing StreamBuilder
  Widget _buildStreamBuilder() {
    return Center(
      child: StreamBuilder<int>(
        stream: _stopwatch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return Text('Stopwatch = ${snapshot.data}');
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }

  // used by StreamBuilder
  Stream<int> _stopwatch() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield _count++;
    }
  }
}
