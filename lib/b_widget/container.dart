import 'package:flutter/material.dart';

import 'main.dart';

class Demo1 extends Data{
  @override
  void init() {
    title="default";
    code = '''
/*
Container({
  this.alignment,
  this.padding, //容器内补白，属于decoration的装饰范围
  Color color, // 背景色， color和decoration是互斥的，如果同时设置它们则会报错！实际上，当指定color时，Container内会自动创建一个decoration
  Decoration decoration, // 背景装饰
  Decoration foregroundDecoration, //前景装饰
  double width,//容器的宽度
  double height, //容器的高度
  BoxConstraints constraints, //容器大小的限制条件
  this.margin,//容器外补白，不属于decoration的装饰范围
  this.transform, //变换
  this.child,
  ...
})
 */
Container(
  margin: const EdgeInsets.all(20.0), //容器外补白
  color: Colors.orange,
  child: const Text("Hello world!"),
),
Container(
  padding: const EdgeInsets.all(20.0), //容器内补白
  color: Colors.orange,
  child: const Text("Hello world!"),
),
Container(
  margin: const EdgeInsets.only(top: 50.0, left: 120.0),
  constraints: const BoxConstraints.tightFor(width: 200.0, height: 150.0),//卡片大小
  decoration: const BoxDecoration(  //背景装饰
    gradient: RadialGradient( //背景径向渐变
      colors: [Colors.red, Colors.orange],
      center: Alignment.topLeft,
      radius: .98,
    ),
    boxShadow: [
      //卡片阴影
      BoxShadow(
        color: Colors.black54,
        offset: Offset(2.0, 2.0),
        blurRadius: 4.0,
      )
    ],
  ),
  transform: Matrix4.rotationZ(.2),//卡片倾斜变换
  alignment: Alignment.center, //卡片内文字居中
  child: const Text(
    //卡片文字
    "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
  ),
)
''';
    ui = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(20.0), //容器外补白
            color: Colors.orange,
            child: const Text("Hello world!"),
          ),
          Container(
            padding: const EdgeInsets.all(20.0), //容器内补白
            color: Colors.orange,
            child: const Text("Hello world!"),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50.0, left: 120.0),
            constraints: const BoxConstraints.tightFor(width: 200.0, height: 150.0),//卡片大小
            decoration: const BoxDecoration(  //背景装饰
              gradient: RadialGradient( //背景径向渐变
                colors: [Colors.red, Colors.orange],
                center: Alignment.topLeft,
                radius: .98,
              ),
              boxShadow: [
                //卡片阴影
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0,
                )
              ],
            ),
            transform: Matrix4.rotationZ(.2),//卡片倾斜变换
            alignment: Alignment.center, //卡片内文字居中
            child: const Text(
              //卡片文字
              "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerWidget extends Datas {
  @override
  void init() {
    title = "Container";
    list.add(Demo1()..init());
  }
}