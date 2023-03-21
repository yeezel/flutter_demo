import 'dart:ui';

import '../common/ProfileChangeNotifier.dart';

class LocaleModel extends ProfileChangeNotifier {
  // 获取当前用户的APP语言配置Locale类，如果为null，则语言跟随系统语言
  Locale? getLocale() {
    if (g_profile.locale == null) return null;
    var t = g_profile.locale?.split("_");
    return Locale(t![0], t[1]);
  }

  // 获取当前Locale的字符串表示
  String? get locale => g_profile.locale;

  // 用户改变APP语言后，通知依赖项更新，新语言会立即生效
  set locale(String? locale) {
    if (locale != g_profile.locale) {
      g_profile.locale = locale;
      notifyListeners();
    }
  }
}