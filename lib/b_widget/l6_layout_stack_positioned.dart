import 'package:flutter/material.dart';

//层叠布局
//stack允许子组件堆叠，而Positioned用于根据Stack的四个角来确定子组件的位置
//这两个组件实现绝对定位
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
      home: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
          fit: StackFit.expand, //未定位widget占满Stack整个空间
          children: <Widget>[
            Container(
              color: Colors.red,
              child: const Text("Hello world",style: TextStyle(color: Colors.white)),
            ),
            const Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            const Positioned(
              top: 18.0,
              child: Text("Your friend"),
            )
          ],
        ),
      ),
    );
  }
}