import 'package:flutter/material.dart';

//对齐与相对定位
//只想简单的调整一个子元素在父元素中的位置的话，使用Align组件
//Align和Stack区别：
// 1. 定位参考系统不同；Stack/Positioned定位的的参考系可以是父容器矩形的四个顶点；而Align则需要先通过alignment 参数来确定坐标原点，不同的alignment会对应不同原点，最终的偏移是需要通过alignment的转换公式来计算出。
// 2. Stack可以有多个子元素，并且子元素可以堆叠，而Align只能有一个子元素，不存在堆叠。
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
        child: Container(
          // height: 120.0,
          // width: 120.0,
          color: Colors.blue.shade50,
          child: const Align(
            //widthFactor和heightFactor是两个缩放因子，会分别乘以子元素的宽、高，最终的结果就是Align 组件的宽高
            //如果值为null，则组件的宽高将会占用尽可能多的空间
            //以下设置等同于height：120，width：120。  widthFactor/heightFactor * size = 120
            widthFactor: 2,
            heightFactor: 2,
            alignment: Alignment.topRight,

            //Alignment Widget会以矩形的中心点作为坐标原点，值从-1到1分别代表矩形左边到右边的距离和顶部到底边的距离
            //如Alignment(-1.0, -1.0) 代表矩形的左侧顶点，而Alignment(1.0, 1.0)代表右侧底部终点，而Alignment(1.0, -1.0) 则正是右侧顶点
            //Alignment可以通过其坐标转换公式将其坐标转为子元素的具体偏移坐标：(Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight/2+childHeight/2)
            // alignment: Alignment(1,0.0),

            //和 Alignment唯一的区别就是坐标原点不同！FractionalOffset 的坐标原点为矩形的左侧顶点
            //FractionalOffset的坐标转换公式为：实际偏移 = (FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)
            // alignment: FractionalOffset(0.2, 0.6),
            child: FlutterLogo(
              size: 60,
            ),
          ),
        )
      ),
    );
  }
}