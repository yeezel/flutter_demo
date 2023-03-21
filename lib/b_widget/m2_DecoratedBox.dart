import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

//装饰容器
//可以在其子组件绘制前(或后)绘制一些装饰（Decoration），如背景、边框、渐变等。
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
      home:  DecoratedBox(
          // 是一个Decoration的子类，实现了常用的装饰元素的绘制。
          /*
          BoxDecoration({
            Color color, //颜色
            DecorationImage image,//图片
            BoxBorder border, //边框
            BorderRadiusGeometry borderRadius, //圆角
            List<BoxShadow> boxShadow, //阴影,可以指定多个
            Gradient gradient, //渐变
            BlendMode backgroundBlendMode, //背景混合模式
            BoxShape shape = BoxShape.rectangle, //形状
          })
           */
          decoration: BoxDecoration(
              gradient: LinearGradient(colors:[Colors.red,Colors.orange.shade700]), //背景渐变
              borderRadius: BorderRadius.circular(3.0), //3像素圆角
              boxShadow: const [ //阴影
                BoxShadow(
                    color:Colors.black54,
                    offset: Offset(2.0,2.0),
                    blurRadius: 4.0
                )
              ]
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
            child: Text("Login", style: TextStyle(color: Colors.white),),
          )
      )
    );
  }
}
