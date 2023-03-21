import 'package:flutter/material.dart';

//匿名路由
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
      home: const RouterTestRoute(),
    );
  }
}
class RouterTestRoute extends StatelessWidget {
  const RouterTestRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("提示"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "路由跳转",
            ),
            ElevatedButton(
              onPressed: () async {
                // 打开`TipRoute`，并等待返回结果
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const TipRoute(
                        // 路由参数
                        text: "我是提示xxxx",
                      );
                    },
                  ),
                );
                //输出`TipRoute`路由返回结果
                debugPrint("路由返回值: $result");
              },
              child: const Text("打开提示页"),
            ),
          ],
        )
      ),
    );
  }
}
class TipRoute extends StatelessWidget {
  const TipRoute({
    Key? key,
    required this.text,  // 接收一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("提示"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, "我是返回值1"),
                child: const Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}