import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'o_l10n_intl_tool_DemoLocalizations.dart';

//使用工具生成arb和翻译类
/**
生成的arb文件需要手动添加@@locale字段
flutter pub run intl_generator:extract_to_arb --output-dir=static/l10n/arb-tool lib/a_basic/o_l10n_intl_tool_DemoLocalizations.dart
flutter pub run intl_generator:generate_from_arb --output-dir=lib/a_basic --generated-file-prefix=o_l10n_intl_tool_ --no-use-deferred-loading lib/a_basic/o_l10n_intl_tool_DemoLocalizations.dart static/l10n/arb-tool/intl_*.arb
*/
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LocaleModel()),
      ],
      child: Consumer<LocaleModel>(
        builder: (BuildContext context, localeModel, child) {
          return MaterialApp(
            onGenerateTitle: (context){
              return DemoLocalizations.of(context).title;
            },
            home: const MyHomePage(),
            locale: localeModel.getLocale(),
            localizationsDelegates: const [
              //本地化字符串
              GlobalMaterialLocalizations.delegate,
              //文本排列方向
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              // 注册我们的Delegate
              DemoLocalizationsDelegate()
            ],
            supportedLocales: const [
              Locale('en', 'US'), // 美国英语
              Locale('zh', 'CN'), // 中文简体
              //其他Locales
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              if (localeModel.getLocale() != null) {
              // debugPrint(locale.toString());
                //如果已经选定语言，则不跟随系统
                return localeModel.getLocale();
              } else {
                //跟随系统
                Locale mlocale;
                if (supportedLocales.contains(locale)) {
                  mlocale= locale!;
                } else {
                  //如果系统语言不是中文简体或美国英语，则默认使用美国英语
                  mlocale= const Locale('en', 'US');
                }
                return mlocale;
              }
            },
          );
        },
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    var localeModel = Provider.of<LocaleModel>(context);
    var gm = DemoLocalizations.of(context);
    Widget _buildLanguageItem(String lan, value) {
      return ListTile(
        title: Text(
          lan,
          // 对APP当前语言进行高亮显示
          style: TextStyle(color: localeModel.locale == value ? color : null),
        ),
        trailing:
        localeModel.locale == value ? Icon(Icons.done, color: color) : null,
        onTap: () {
          // 此行代码会通知MaterialApp重新build
          localeModel.locale = value;
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(gm.language),
      ),
      body: ListView(
        children: <Widget>[
          _buildLanguageItem("中文简体", "zh_CN"),
          _buildLanguageItem("English", "en_US"),
          _buildLanguageItem(gm.auto, null),
        ],
      ),
    );
  }
}
class LocaleModel extends ChangeNotifier {
  String? mylocale;
  // 获取当前用户的APP语言配置Locale类，如果为null，则语言跟随系统语言
  Locale? getLocale() {
    if (mylocale == null) return null;
    var t = mylocale!.split("_");
    return Locale(t![0], t[1]);
  }

  // 获取当前Locale的字符串表示
  String? get locale => mylocale;

  // 用户改变APP语言后，通知依赖项更新，新语言会立即生效
  set locale(String? locale) {
    if (locale != mylocale) {
      mylocale = locale;
      notifyListeners();
    }
  }
}