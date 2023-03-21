import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//状态共享
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
          var color = Theme.of(context).primaryColor;
          Widget _buildLanguageItem(String lan, value) {
            return ListTile(
              title: Text(
                lan,
                // 对APP当前语言进行高亮显示
                style: TextStyle(
                    color: localeModel.locale == value ? color : null),
              ),
              trailing: localeModel.locale == value
                  ? Icon(Icons.done, color: color)
                  : null,
              onTap: () {
                // 此行代码会通知MaterialApp重新build
                localeModel.locale = value;
              },
            );
          }

          return MaterialApp(
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              onGenerateTitle: (context) {
                return "okk";
              },
              home: Scaffold(
                appBar: AppBar(
                  title: Text(Provider.of<LocaleModel>(context).mylocale),
                ),
                body: ListView(
                  children: <Widget>[
                    _buildLanguageItem("中文简体", "zh_CN"),
                    _buildLanguageItem("English", "en_US"),
                  ],
                ),
              ),
          );
        },
      ),
    );
  }
}

class LocaleModel extends ChangeNotifier {
  String mylocale="test_lan";
  // 获取当前用户的APP语言配置Locale类，如果为null，则语言跟随系统语言
  Locale? getLocale() {
    var t = mylocale.split("_");
    return Locale(t[0], t[1]);
  }

  // 获取当前Locale的字符串表示
  String get locale => mylocale;

  // 用户改变APP语言后，通知依赖项更新，新语言会立即生效
  set locale(String locale) {
    if (locale != mylocale) {
      mylocale = locale;
      notifyListeners();
    }
  }
}