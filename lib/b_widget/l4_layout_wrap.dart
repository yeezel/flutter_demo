import 'package:flutter/material.dart';

//流式布局
//超出屏幕显示范围会自动折行的布局称为流式布局
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //定义一个controller
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Wrap(
            spacing: 8.0, // 主轴(水平)方向间距
            runSpacing: 4.0, // 纵轴（垂直）方向间距
            alignment: WrapAlignment.center, //沿主轴方向居中
            children: const <Widget>[
              Chip(
                avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                label: Text('Hamilton'),
              ),
              Chip(
                avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
                label: Text('Lafayette'),
              ),
              Chip(
                avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
                label: Text('Mulligan'),
              ),
              Chip(
                avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
                label: Text('Laurens'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}