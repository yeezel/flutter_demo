import 'package:flutter/cupertino.dart';

import '../models/profile.dart';
import 'Global.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  Profile get g_profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile(); //保存Profile变更
    super.notifyListeners(); //通知依赖的Widget更新
  }
}