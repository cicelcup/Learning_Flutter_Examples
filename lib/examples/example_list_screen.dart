import 'package:flutter/material.dart';
import 'package:learningflutterexamples/data/Example.dart';
import 'package:learningflutterexamples/general/AppStrings.dart';
import 'all_examples.dart';

//Examples List Screen
class ExamplesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Get all the examples
    final _examplesList = AllExamples.getAllExamples();
    return Scaffold(
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
      child: ListTile(
        title: Text(example.title),
        subtitle: Text(example.subtitle),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => example.widgetExample));
        },
      ),
    );
  }
}
