import 'package:learningflutterexamples/data/Example.dart';
import 'package:learningflutterexamples/examples/action_icon_example.dart';
import 'package:learningflutterexamples/examples/audio/audio_service_example.dart';
import 'package:learningflutterexamples/examples/autocomplete_example.dart';
import 'package:learningflutterexamples/examples/check_platform_example.dart';
import 'package:learningflutterexamples/examples/dropdown_search_example.dart';
import 'package:learningflutterexamples/examples/expansion_panel_example.dart';
import 'package:learningflutterexamples/examples/forms/form_screen_example.dart';
import 'package:learningflutterexamples/examples/future_stream_example.dart';
import 'package:learningflutterexamples/examples/providers/provider_example.dart';
import 'package:learningflutterexamples/examples/sembast_2_example.dart';
import 'package:learningflutterexamples/examples/sembast/sembast_example.dart';
import 'package:learningflutterexamples/examples/share_example.dart';
import 'package:learningflutterexamples/examples/splash/splash_screen_example.dart';
import 'package:learningflutterexamples/examples/stateful_example.dart';
import 'package:learningflutterexamples/examples/backdrop_example.dart';
import 'package:learningflutterexamples/general/app_strings.dart';

//class to create the example list
class AllExamples {
  //List of examples
  static final List<Example> _list = [];

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

    _list.add(Example(
        title: AppStrings.exampleTitle11, widgetExample: Sembast2Example()));

    _list.add(Example(
        title: AppStrings.exampleTitle12, widgetExample: ActionIconExample()));

    _list.add(Example(
        title: AppStrings.exampleTitle13,
        widgetExample: AudioServiceExample()));

    _list.add(Example(
        title: AppStrings.exampleTitle14, widgetExample: FormScreenExample()));

    _list.add(Example(
        title: AppStrings.exampleTitle15,
        widgetExample: ExpansionPanelExample()));

    return _list;
  }
}
