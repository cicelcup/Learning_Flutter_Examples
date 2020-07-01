import 'package:learningflutterexamples/data/Example.dart';
import 'package:learningflutterexamples/examples/example_one.dart';
import 'package:learningflutterexamples/examples/example_two.dart';
import 'package:learningflutterexamples/general/AppStrings.dart';

//class to create the example list
class AllExamples {
  static List<Example> _list = [];

  static List<Example> getAllExamples() {
    //Clear the list to avoid generate again when reStart the app
    _list.clear();
    _list.add(
      Example(
        title: AppStrings.exampleOneTitle,
        subtitle: AppStrings.exampleOneSubTitle,
        widgetExample: ExampleOne(),
      ),
    );

    _list.add(
      Example(
        title: AppStrings.exampleTwoTitle,
        subtitle: AppStrings.exampleTwoSubTitle,
        widgetExample: ExampleTwo(),
      ),
    );

    return _list;
  }
}
