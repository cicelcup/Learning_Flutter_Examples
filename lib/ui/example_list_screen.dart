import 'package:flutter/material.dart';
import 'package:learningflutterexamples/data/Example.dart';
import 'package:learningflutterexamples/data/all_examples.dart';
import 'package:learningflutterexamples/general/app_colors.dart';
import 'package:learningflutterexamples/general/app_strings.dart';
import 'example_list_screen_i18n.dart';

//Examples List Screen with all the examples
class ExamplesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Get all the examples
    final _examplesList = AllExamples.getAllExamples();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(title: Text(AppStrings.appBarTitle.i18n)),
      body: ListView.builder(
        itemCount: _examplesList.length,
        itemBuilder: (context, index) {
          return ExampleItem(
            example: _examplesList[index],
            index: index,
          );
        },
      ),
    );
  }
}

//Item of the list
class ExampleItem extends StatelessWidget {
  final Example example;
  final int index;

  const ExampleItem({this.example, this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text('${index + 1}')),
        title: Text(
          example.title,
          style: TextStyle(color: AppColors.accentColor),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => example.widgetExample));
        },
      ),
    );
  }
}
