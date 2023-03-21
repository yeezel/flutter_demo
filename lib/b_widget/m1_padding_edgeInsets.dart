import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

//获取组件大小和位置
//填充
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
      home: const PaddingTestRoute()
    );
  }
}
class PaddingTestRoute extends StatelessWidget {
  const PaddingTestRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      //上下左右各添加16像素补白
      padding: const EdgeInsets.all(16),
      child: Column(
        //显式指定对齐方式为左对齐，排除对齐干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: const <Widget>[
          /*
          EdgeInsets：
            fromLTRB(double left, double top, double right, double bottom)：分别指定四个方向的填充。
            all(double value) : 所有方向均使用相同数值的填充。
            only({left, top, right ,bottom })：可以设置具体某个方向的填充(可以同时指定多个方向)。
            symmetric({ vertical, horizontal })：用于设置对称方向的填充，vertical指top和bottom，horizontal指left和right
           */
          Padding(
            //左边添加8像素补白
            padding: EdgeInsets.only(left: 8),
            child: Text("Hello world"),
          ),
          Padding(
            //上下各添加8像素补白
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text("I am Jack"),
          ),
          Padding(
            // 分别指定四个方向的补白
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }
}
