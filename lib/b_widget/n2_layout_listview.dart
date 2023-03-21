import 'package:flutter/material.dart';

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
          child: ListView(
            //该属性表示是否根据子组件的总长度来设置ListView的长度，默认值为false 。
            // 默认情况下，ListView会在滚动方向尽可能多的占用空间。当ListView在一个无边界(滚动方向上)的容器中时，shrinkWrap必须为true。
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            //children参数适合只有少量的子组件数量已知且比较少的情况，否则应该使用ListView.builder 按需动态构建列表项
            children: const <Widget>[
              Text('I\'m dedicating every day to you'),
              Text('Domestic life was never quite my style'),
              Text('When you smile, you knock me out, I fall apart'),
              Text('And I thought I was so smart'),
            ],
          )
        ),
      ),
    );
  }
}
