import 'package:flutter/material.dart';

//自定义子组件适配父组件空间
/*
原理：
   1. FittedBox 在布局子组件时会忽略其父组件传递的约束，可以允许子组件无限大，即FittedBox 传递给子组件的约束为（0<=width<=double.infinity, 0<= height <=double.infinity）。
   2. FittedBox 对子组件布局结束后就可以获得子组件真实的大小。
   3. FittedBox 知道子组件的真实大小也知道他父组件的约束，那么FittedBox 就可以通过指定的适配方式（BoxFit 枚举中指定），让起子组件在 FittedBox 父组件的约束范围内按照指定的方式显示。
const FittedBox({
  Key? key,
  this.fit = BoxFit.contain, // 适配方式
  this.alignment = Alignment.center, //对齐方式
  this.clipBehavior = Clip.none, //是否剪裁
  Widget? child,
})
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
            children: <Widget>[
              //没有自适配空间
              wContainer(BoxFit.none),
              const Text('没有自适配'),
              wContainer1(BoxFit.none),
              const Text('裁剪没有自适配'),
              //包含
              wContainer(BoxFit.contain),
              const Text('已自适配'),
              //单行缩放布局
              wRow(' 90000000000000000 '),
              //会自动缩放
              FittedBox(child: wRow(' 90000000000000000 ')),
              SingleLineFittedBox(child: wRow(' 90000000000000000 ')),
            ]
          ),
        ),
      ),
    );
  }

  Widget wContainer(BoxFit boxFit) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: FittedBox(
        fit: boxFit,
        // 子容器超过父容器大小
        child: Container(width: 60, height: 70, color: Colors.blue),
      ),
    );
  }

  Widget wContainer1(BoxFit boxFit) {
    return ClipRect( // 将超出子组件布局范围的绘制内容剪裁掉
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
        child: FittedBox(
          fit: boxFit,
          child: Container(width: 60, height: 70, color: Colors.blue),
        ),
      ),
    );
  }

// 直接使用Row
  Widget wRow(String text) {
    Widget child = Text(text);
    child = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [child, child, child],
    );
    return child;
  }
}

class SingleLineFittedBox extends StatelessWidget {
  const SingleLineFittedBox({Key? key,this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return FittedBox(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              //让 maxWidth 使用屏幕宽度
              //   maxWidth: constraints.maxWidth
              minWidth: constraints.maxWidth,
              maxWidth: double.infinity,
            ),
            child: child,
          ),
        );
      },
    );
  }
}
