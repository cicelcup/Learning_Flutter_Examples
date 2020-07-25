import 'package:learningflutterexamples/data/Example.dart';
import 'package:learningflutterexamples/examples/autocomplete_example.dart';
import 'package:learningflutterexamples/examples/check_platform_example.dart';
import 'package:learningflutterexamples/examples/dropdown_search_example.dart';
import 'package:learningflutterexamples/examples/future_stream_example.dart';
import 'package:learningflutterexamples/examples/provider_example.dart';
import 'package:learningflutterexamples/examples/sembast_example.dart';
import 'package:learningflutterexamples/examples/share_example.dart';
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
    _list.add(Example(
        title: AppStrings.exampleTitle1, widgetExample: StatefulExample()));

    _list.add(Example(
        title: AppStrings.exampleTitle2, widgetExample: BackDropExample()));

    _list.add(Example(
        title: AppStrings.exampleTitle3, widgetExample: SplashScreenExample()));

    _list.add(Example(
        title: AppStrings.exampleTitle4, widgetExample: AutoCompleteExample()));

    _list.add(Example(
        title: AppStrings.exampleTitle5,
        widgetExample: DropDownSearchExample()));

    _list.add(Example(
        title: AppStrings.exampleTitle6,
        widgetExample: CheckPlatformExample()));

    _list.add(Example(
        title: AppStrings.exampleTitle7, widgetExample: ShareExample()));

    _list.add(Example(
        title: AppStrings.exampleTitle8, widgetExample: ProviderExample()));

    _list.add(Example(
        title: AppStrings.exampleTitle9, widgetExample: FutureStreamExample()));

    _list.add(Example(
        title: AppStrings.exampleTitle10, widgetExample: SembastExample()));

    return _list;
  }
}
