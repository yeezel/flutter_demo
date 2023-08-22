import 'dart:async';

import 'package:flutter/material.dart';

void collectLog(String line) {
  //收集日志
  // debugPrint(line);
}

void reportErrorAndLog(FlutterErrorDetails details) {
  //上报错误和日志逻辑
  debugPrint(details.toString());
}

FlutterErrorDetails makeDetails(Object obj, StackTrace stack) {
  // 构建错误信息
  // debugPrint(obj.toString());
  return FlutterErrorDetails(exception: obj, stack: stack);
}

void main() {
  var onError = FlutterError.onError; //先将 onerror 保存起来
  //FlutterError.onError可接收到flutter捕获到的异常
  FlutterError.onError = (FlutterErrorDetails details) {
    onError?.call(details); //调用默认的onError
    reportErrorAndLog(details); //上报
  };

  //Zone中可以捕获日志输出、Timer创建、微任务调度的行为，同时Zone也可以捕获所有未处理的异常
  runZoned(
    //可以捕获所有未处理的异常
    () => runApp(const MyApp()), //监控待捕获的数据
    //Zone的一些配置，可以自定义一些代码行为，比如拦截日志输出和错误等
    zoneSpecification: ZoneSpecification(
      // 拦截print
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        collectLog(line);
        parent.print(zone, "Interceptor: $line");
      },
      // 拦截未处理的异步错误
      handleUncaughtError: (Zone self, ZoneDelegate parent, Zone zone,
          Object error, StackTrace stackTrace) {
        reportErrorAndLog(makeDetails(error,stackTrace));
        parent.print(zone, '${error.toString()} $stackTrace');
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '异常demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => 12 as String!,
                child: const Text("错误测试"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
