import 'package:flutter/material.dart';

//异步更新UI
//和Future 不同的是，它可以接收多个异步操作的结果，它常用于会多次读取数据的异步任务场景，如网络内容下载、文件读写等
class StreamBuilderFunc extends StatelessWidget {
  const StreamBuilderFunc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
            child: StreamBuilder<int>(
          stream: counter(), //
          //initialData: ,// a Stream<int> or null
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('没有Stream');
              case ConnectionState.waiting:
                return const Text('等待数据...');
              //ConnectionState.active只在StreamBuilder中才会出现。
              case ConnectionState.active:
                return Text('active: ${snapshot.data}');
              case ConnectionState.done:
                return const Text('Stream 已关闭');
            }
            // return null; // unreachable
          },
        )),
      ),
    );
  }

  Stream<int> counter() {
    return Stream.periodic(const Duration(seconds: 2), (i) {
      return i;
    });
  }
}
