import 'package:flutter/material.dart';

//异步更新UI
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Center(
            child: FutureBuilder<String>(
              future: mockNetworkData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                /*
                  /// 当前没有异步任务，比如[FutureBuilder]的[future]为null时
                  none,
                  /// 异步任务处于等待状态
                  waiting,
                  /// Stream处于激活状态（流上已经有数据传递了），对于FutureBuilder没有该状态。
                  active,
                  /// 异步任务已经终止.
                  done,
                 */
                // 请求已结束
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    // 请求失败，显示错误
                    return Text("Error: ${snapshot.error}");
                  } else {
                    // 请求成功，显示数据
                    return Text("Contents: ${snapshot.data}");
                  }
                } else {
                  // 请求未结束，显示loading
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
      );
  }

  Future<String> mockNetworkData() async {
    return Future.delayed(const Duration(seconds: 5), () => "我是从互联网上获取的数据");
  }

}