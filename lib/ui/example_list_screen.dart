import 'package:flutter/material.dart';
import 'package:learningflutterexamples/data/Example.dart';
import 'package:learningflutterexamples/general/AppStrings.dart';
import '../data/all_examples.dart';

//Examples List Screen with all the examples
class ExamplesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Get all the examples
    final _examplesList = AllExamples.getAllExamples();
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text(AppStrings.appBarTitle),
      ),
      body: ListView.builder(
        itemCount: _examplesList.length,
        itemBuilder: (context, index) {
          return ExampleItem(example: _examplesList[index]);
        },
      ),
    );
  }
}

//Item of the list
class ExampleItem extends StatelessWidget {
  final Example example;

  const ExampleItem({Key key, this.example}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(example.title),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => example.widgetExample));
        },
      ),
    );
  }
}
