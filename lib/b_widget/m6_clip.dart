import 'package:flutter/material.dart';

/*
剪裁Widget 	默认行为
ClipOval 	子组件为正方形时剪裁成内贴圆形；为矩形时，剪裁成内贴椭圆
ClipRRect 	将子组件剪裁为圆角矩形
ClipRect 	默认剪裁掉子组件布局空间之外的绘制内容（溢出部分剪裁）
ClipPath 	按照自定义的路径剪裁
 */

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              ClipTestRoute(),
            ],
          ),
        ),
      ),
    );
  }
}

class ClipTestRoute extends StatelessWidget {
  const ClipTestRoute({super.key});

  @override
  Widget build(BuildContext context) {
    // 头像
    Widget avatar = Image.asset("static/imgs/avatar.png", width: 60.0);
    return Center(
      child: Column(
        children: <Widget>[
          avatar, //不剪裁
          ClipOval(child: avatar), //剪裁为圆形
          ClipRRect(
            //剪裁为圆角矩形
            borderRadius: BorderRadius.circular(5.0),
            child: avatar,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
                child: avatar,
              ),
              const Text(
                "你好世界",
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRect(
                //将溢出部分剪裁
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5, //宽度设为原来宽度一半
                  child: avatar,
                ),
              ),
              const Text("你好世界", style: TextStyle(color: Colors.green))
            ],
          ),
          //自定义裁剪
          DecoratedBox(
            decoration: const BoxDecoration(
                color: Colors.red
            ),
            child: ClipRect(
                clipper: MyClipper(), //使用自定义的clipper
                child: avatar
            ),
          )
        ],
      ),
    );
  }
}
class MyClipper extends CustomClipper<Rect> {
  /*
    如果在应用中，剪裁区域始终不会发生变化时应该返回false，这样就不会触发重新剪裁，避免不必要的性能开销。
   */
  @override
  Rect getClip(Size size) => const Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  /*
  接口决定是否重新剪裁。
  如果在应用中，剪裁区域始终不会发生变化时应该返回false，这样就不会触发重新剪裁，避免不必要的性能开销。
  如果剪裁区域会发生变化（比如在对剪裁区域执行一个动画），那么变化后应该返回true来重新执行剪裁。
   */
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
