import 'package:learningflutterexamples/data/Example.dart';
import 'package:learningflutterexamples/examples/stateful_example.dart';
import 'package:learningflutterexamples/examples/backdrop_example.dart';
import 'package:learningflutterexamples/general/AppStrings.dart';

//class to create the example list
class AllExamples {
  //List of examples
  static List<Example> _list = [];

  static List<Example> getAllExamples() {
    //Clear the list to avoid generate again when reStart the app
    _list.clear();
    _list.add(
      //add the example to the list
      Example(
        title: AppStrings.exampleOneTitle,
        subtitle: AppStrings.exampleOneSubTitle,
        widgetExample: StatefulExample(),
      ),
    );

    //add the example to the list
    _list.add(
      Example(
        title: AppStrings.exampleTwoTitle,
        subtitle: AppStrings.exampleTwoSubTitle,
        widgetExample: BackDropExample(),
      ),
    );

    return _list;
  }
}
