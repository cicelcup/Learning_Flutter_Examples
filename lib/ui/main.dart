import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:learningflutterexamples/general/app_strings.dart';
import 'package:learningflutterexamples/general/app_theme.dart';
import 'example_list_screen.dart';

void main() {
  runApp(MyApp());
}

//Start of the application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: appTheme,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('es'),
      ],
      home: I18n(
        child: ExamplesListScreen(),
      ),
    );
  }
}
