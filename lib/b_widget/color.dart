import 'package:flutter/material.dart';

import 'main.dart';

/*
将颜色字符串转换为color对象
Color(0xffdc380d); //如果颜色固定可以直接使用整数值
//颜色是一个字符串变量
var c = "dc380d";
Color(int.parse(c,radix:16)|0xFF000000) //通过位运算符将Alpha设置为FF
Color(int.parse(c,radix:16)).withAlpha(255)  //通过方法将Alpha设置为FF

MaterialColor是实现Material Design中的颜色的类，它包含一种颜色的10个级别的渐变色。
MaterialColor通过"shadeXXX"运算符的索引值来代表颜色的深度，
有效的索引有：50，100，200，…，900，数字越大，颜色越深。
 */

class Demo1 extends Data{
  @override
  void init() {
    title="default";
    code = '''
/*
将颜色字符串转换为color对象
Color(0xffdc380d); //如果颜色固定可以直接使用整数值
//颜色是一个字符串变量
var c = "dc380d";
Color(int.parse(c,radix:16)|0xFF000000) //通过位运算符将Alpha设置为FF
Color(int.parse(c,radix:16)).withAlpha(255)  //通过方法将Alpha设置为FF

MaterialColor是实现Material Design中的颜色的类，它包含一种颜色的10个级别的渐变色。
MaterialColor通过"shadeXXX"运算符的索引值来代表颜色的深度，
有效的索引有：50，100，200，…，900，数字越大，颜色越深。
*/

//背景为蓝色，则title自动为白色
NavBar(color: Colors.blue, title: "标题"),
//背景为白色，则title自动为黑色
NavBar(color: Colors.white, title: "标题"),

class NavBar extends StatelessWidget {
  final String title;
  final Color color; //背景颜色

  const NavBar({super.key,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: const [
          //阴影
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 3,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          //根据背景色亮度来确定Title颜色
          color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
''';
    ui = const Column(
      children: <Widget>[
        //背景为蓝色，则title自动为白色
        NavBar(color: Colors.blue, title: "标题"),
        //背景为白色，则title自动为黑色
        NavBar(color: Colors.white, title: "标题"),
    ]);
  }
}

class ColorWidget extends Datas {
  @override
  void init() {
    title = "Color";
    list.add(Demo1()..init());
  }
}
class NavBar extends StatelessWidget {
  final String title;
  final Color color; //背景颜色

  const NavBar({super.key,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: const [
          //阴影
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 3,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          //根据背景色亮度来确定Title颜色
          color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
