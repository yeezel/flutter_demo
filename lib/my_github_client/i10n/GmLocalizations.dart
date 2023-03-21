import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart'; //是通过intl_generator工具从arb文件生成的代码

//Locale资源类
class GmLocalizations {

  //为了使用方便，我们定义一个静态方法
  static GmLocalizations of(BuildContext context) {
    return Localizations.of<GmLocalizations>(context, GmLocalizations)!;
  }
  static Future<GmLocalizations> load(Locale locale) {
    final String name = locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    //initializeMessages是messages_all里的方法
    return initializeMessages(localeName).then((b) {
      Intl.defaultLocale = localeName;
      return GmLocalizations();
    });
  }
  //Locale相关值，title为应用标题
  String get title => Intl.message(
      'Github APP',
      name: 'title',
      desc: 'Title for the Demo application',
    );
  String get login => Intl.message(
    'login',
    name: 'login',
  );
  String get home => Intl.message(
    'home',
    name: 'home',
  );
  String get language => Intl.message(
    'language',
    name: 'language',
  );
  String get auto => Intl.message(
    'auto',
    name: 'auto',
  );
  String get userName => Intl.message(
    'userName',
    name: 'userName',
  );
  String get userNameRequired => Intl.message(
    'userNameRequired',
    name: 'userNameRequired',
  );
  String get passwordRequired => Intl.message(
    'passwordRequired',
    name: 'passwordRequired',
  );
  String get password => Intl.message(
    'password',
    name: 'password',
  );
  String get userNameOrPasswordWrong => Intl.message(
    'userNameOrPasswordWrong',
    name: 'userNameOrPasswordWrong',
  );
  String get noDescription => Intl.message(
    'noDescription',
    name: 'noDescription',
  );
  String get theme => Intl.message(
    'theme',
    name: 'theme',
  );
  String get logout => Intl.message(
    'logout',
    name: 'logout',
  );
  String get logoutTip => Intl.message(
    'logoutTip',
    name: 'logoutTip',
  );
  String get cancel => Intl.message(
    'cancel',
    name: 'cancel',
  );
  String get yes => Intl.message(
    'yes',
    name: 'yes',
  );
}

//Locale代理类
class GmLocalizationsDelegate extends LocalizationsDelegate<GmLocalizations> {
  const GmLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<GmLocalizations> load(Locale locale) {
    return  GmLocalizations.load(locale);
  }

//返回值决定当Localizations组件重新build时，是否调用load方法重新加载Locale资源。
//一般情况下，Locale资源只应该在Locale切换时加载一次，不需要每次在Localizations重新build时都加载，所以返回false即可。
//但每当Locale改变时Flutter都会再调用load方法加载新的Locale，无论shouldReload返回true还是false。
  @override
  bool shouldReload(GmLocalizationsDelegate old) => false;
}