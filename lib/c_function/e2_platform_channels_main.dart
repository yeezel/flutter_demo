
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'e2_platform_channels_auto_battery.dart';

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
void main() {
  debugPrint("platform : ${defaultTargetPlatform.name}");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyApp> {

  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final battery = Battery();
      final result = await battery.getBatteryData();
      debugPrint('Battery level: ${result.level}');
      batteryLevel = 'Battery level at ${result.level} % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _getBatteryLevel,
                child: const Text('Get Battery Level'),
              ),
              Text(_batteryLevel),
            ],
          ),
        ),
      ),
    );
  }
}