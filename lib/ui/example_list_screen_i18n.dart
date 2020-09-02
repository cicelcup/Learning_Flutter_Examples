import 'package:i18n_extension/i18n_extension.dart';
import 'package:learningflutterexamples/general/app_strings.dart';

extension Localization on String {
  static final _t = Translations.byLocale('en') +
      {
        'es': {
          AppStrings.appBarTitle: 'Lista de Ejemplo',
        }
      };

  String get i18n => localize(this, _t);
}
