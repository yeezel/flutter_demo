import 'dart:async';

import 'package:flutter/material.dart';

//异步更新UI
//和Future 不同的是，它可以接收多个异步操作的结果，它常用于会多次读取数据的异步任务场景，如网络内容下载、文件读写等

class StreamBuilderFunc extends StatelessWidget {
  const StreamBuilderFunc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('StreamBuilder日志示例')),
        body: LogScreen(),
      ),
    );
  }
}
class LogScreen extends StatefulWidget {
  const LogScreen({super.key});

  @override
  State<LogScreen> createState() => _LogScreenState();
}
class _LogScreenState extends State<LogScreen> {
  // 创建一个流控制器
  final StreamController<String> _controller = StreamController<String>();
  // 创建一个日志列表
  final List<String> _logs = [];

  @override
  void initState() {
    super.initState();
    // 模拟产生日志数据
    Timer.periodic(const Duration(seconds: 1), (timer) {
      // 随机生成一个日志级别
      String level = ['INFO', 'DEBUG', 'WARNING', 'ERROR'][timer.tick % 4];
      // 随机生成一个日志内容
      String message = 'This is a $level log message at ${DateTime.now()}';
      // 向流中添加一条日志数据
      _controller.sink.add('$level: $message');
      // 将日志数据添加到列表中
      setState(() {
        if(_logs.length>10) _logs.removeAt(0);
        _logs.add('$level: $message');
      });
    });
  }

  @override
  void dispose() {
    // 关闭流控制器
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      // 监听流控制器的流
      stream: _controller.stream,
      // 构建界面
      builder: (context, snapshot) {
        // 如果快照有数据，就显示最新一条日志；否则显示加载中
        if (snapshot.hasData) {
          return Column(
            children: [
              // 显示最新一条日志
              Text(
                'Latest log: ${snapshot.data}',
                style: TextStyle(
                  fontSize: 20,
                  color: getColor(snapshot.data!), // 根据日志级别设置颜色
                ),
              ),
              const SizedBox(height: 10),
              // 显示所有日志列表
              Expanded(
                child: ListView.builder(
                  itemCount: _logs.length,
                  itemBuilder: (context, index) {
                    return Text(
                      _logs[index],
                      style: TextStyle(
                        color: getColor(_logs[index]), // 根据日志级别设置颜色
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  // 根据日志级别设置颜色的函数
  Color getColor(String log) {
    if (log.startsWith('INFO')) {
      return Colors.blue;
    } else if (log.startsWith('DEBUG')) {
      return Colors.green;
    } else if (log.startsWith('WARNING')) {
      return Colors.orange;
    } else if (log.startsWith('ERROR')) {
      return Colors.red;
    } else {
      return Colors.black;
    }
  }
}
