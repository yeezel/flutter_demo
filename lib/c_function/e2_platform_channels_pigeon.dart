import 'package:pigeon/pigeon.dart';

/*
1. 编写通讯类
2. 执行命令
bat用 ^ ，powershell用 ` （反引号）拼接多行
flutter pub run pigeon `
--input lib/c_function/e2_platform_channels_pigeon.dart `
--dart_out lib/c_function/e2_platform_channels_auto_battery.dart `
--kotlin_out android/app/src/main/kotlin/org/learn/flutter/flutter_demo/Battery.kt
3. 继承平台方生成类重写方法（android的就在android项目编写）
4. 在flutter项目中调用通讯类获取数据
 */

class BatteryData {
  int? level;
}

@HostApi()
abstract class Battery {
  BatteryData getBatteryData();
}

@FlutterApi()
abstract class BatteryApi {
  BatteryData getBatteryData();
}