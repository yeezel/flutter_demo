import 'o_l10n_intl_app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get language => 'language';

  @override
  String get auto => 'auto';
}

/// The translations for English, as used in the United States (`en_US`).
class AppLocalizationsEnUs extends AppLocalizationsEn {
  AppLocalizationsEnUs(): super('en_US');

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get language => 'language';

  @override
  String get auto => 'auto';
}
