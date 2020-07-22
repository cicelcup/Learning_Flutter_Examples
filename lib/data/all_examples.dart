import 'package:learningflutterexamples/data/Example.dart';
import 'package:learningflutterexamples/examples/autocomplete_example.dart';
import 'package:learningflutterexamples/examples/dropdown_search_example.dart';
import 'package:learningflutterexamples/examples/splash_screen_example.dart';
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
        title: AppStrings.exampleTitle1,
        subtitle: AppStrings.exampleSubTitle1,
        widgetExample: StatefulExample(),
      ),
    );

    //add the example to the list
    _list.add(
      Example(
        title: AppStrings.exampleTitle2,
        subtitle: AppStrings.exampleSubTitle2,
        widgetExample: BackDropExample(),
      ),
    );

    //add the example to the list
    _list.add(
      Example(
        title: AppStrings.exampleTitle3,
        subtitle: AppStrings.exampleSubTitle3,
        widgetExample: SplashScreenExample(),
      ),
    );

    //add the example to the list
    _list.add(
      Example(
        title: AppStrings.exampleTitle4,
        subtitle: AppStrings.exampleSubTitle4,
        widgetExample: AutoCompleteExample(),
      ),
    );

    //add the example to the list
    _list.add(
      Example(
        title: AppStrings.exampleTitle5,
        subtitle: AppStrings.exampleSubTitle5,
        widgetExample: DropDownSearchExample(),
      ),
    );

    return _list;
  }
}
