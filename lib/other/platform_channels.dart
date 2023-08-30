
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*
步骤：
1. flutter代码中获取通道，然后调用通道平台方法
```
const platform = MethodChannel('samples.flutter.dev/battery');
int result = await platform.invokeMethod('getBatteryLevel');
```
2. 用IDE打开flutter中对应平台的目录（android项目就用android studio IDE，window就用Visual Studio IDE），不能直接在flutter项目中编辑，会没有环境报错
3. 以开发android为例，打开MainActivity.kt
	1. 声明通道名，必须和flutter获取的名字相同
	2. 编写getBatteryLevel功能
	3. 重写configureFlutterEngine方法，调用MethodChannel方法获取客户端发送过来的调用函数名进行逻辑处理
4. 回到flutter项目中执行
 */
// debugPrint("platform : ${defaultTargetPlatform.name}");
class ChannelsFunc extends StatefulWidget {
  const ChannelsFunc({super.key});

  @override
  State<ChannelsFunc> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<ChannelsFunc> {
  static const platform = MethodChannel('samples.flutter.dev/battery');

  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
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