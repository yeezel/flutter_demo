import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'o_l10n_intl_tool_messages_all.dart'; //是通过intl_generator工具从arb文件生成的代码

//Locale资源类
class DemoLocalizations {

  //为了使用方便，我们定义一个静态方法
  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations)!;
  }
  static Future<DemoLocalizations> load(Locale locale) {
    final String name = locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    //initializeMessages是messages_all里的方法
    return initializeMessages(localeName).then((b) {
      debugPrint("intl: ${Intl.defaultLocale}");
      Intl.defaultLocale = localeName;
      return DemoLocalizations();
    });
  }
  //Locale相关值，title为应用标题
  String get title {
    return Intl.message(
      'Flutter APP',
      name: 'title',
      desc: 'Title for the Demo application',
    );
  }

  String get language {
    return Intl.message(
      'language',
      name: 'language',
    );
  }
  String get auto {
    return Intl.message(
      'auto',
      name: 'auto',
    );
  }
  //带参数的消息
  String remainingEmailsMessage(int howMany) => Intl.plural(howMany,
    zero: 'There are no emails left',
    one: 'There is $howMany email left',
    other: 'There are $howMany emails left',
    name: "remainingEmailsMessage",
    args: [howMany],
    desc: "How many emails remain after archiving.",
    examples: const {'howMany': 42, 'userName': 'Fred'});
  //... 其他的值
}

//Locale代理类
class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  //是否支持某个Local
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<DemoLocalizations> load(Locale locale) {
    return  DemoLocalizations.load(locale);
  }

//返回值决定当Localizations组件重新build时，是否调用load方法重新加载Locale资源。
//一般情况下，Locale资源只应该在Locale切换时加载一次，不需要每次在Localizations重新build时都加载，所以返回false即可。
//但每当Locale改变时Flutter都会再调用load方法加载新的Locale，无论shouldReload返回true还是false。
  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}