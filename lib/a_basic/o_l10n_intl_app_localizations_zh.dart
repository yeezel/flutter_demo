import 'o_l10n_intl_app_localizations.dart';

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get helloWorld => '你好世界!';

  @override
  String get language => '语言';

  @override
  String get auto => '自动';
}

/// The translations for Chinese, as used in China (`zh_CN`).
class AppLocalizationsZhCn extends AppLocalizationsZh {
  AppLocalizationsZhCn(): super('zh_CN');

  @override
  String get helloWorld => '你好世界!';

  @override
  String get language => '语言';

  @override
  String get auto => '自动';
}
