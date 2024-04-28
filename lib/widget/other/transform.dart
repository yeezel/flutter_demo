import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../framework/page/data.dart';
import '../../framework/page/widget_page.dart';

class TransformWidget extends StatelessWidget {
  const TransformWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      Demo1()..init(),
      Demo2()..init(),
      Demo3()..init(),
      Demo4()..init(),
    ]);
  }

}
class Demo1 extends Data{
  @override
  void init() {
    title="transform";
    code = '''
//变换
//可以在其子组件绘制时对其应用一些矩阵变换来实现一些特效。
/*
注意：Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，所以无论对子组件应用何种变化，其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的。
由于矩阵变化只会作用在绘制阶段，所以在某些场景下，在UI需要变化时，
可以直接通过矩阵变化来达到视觉上的UI改变，而不需要去重新触发build流程，这样会节省layout的开销，所以性能会比较好。
如之前介绍的Flow组件，它内部就是用矩阵变换来更新UI，除此之外，Flutter的动画组件中也大量使用了Transform以提高性能。
 */
Container(
  margin: const EdgeInsets.all(20),
  color: Colors.black,
  child: Transform(
    alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
    //Matrix4是一个4D矩阵，通过它我们可以实现各种矩阵操作
    transform: Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
    child: Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.deepOrange,
      child: const Text('Apartment for rent!'),
    ),
  ),
)
''';
    ui = Container(
      margin: const EdgeInsets.all(20),
      color: Colors.black,
      child: Transform(
        alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
        //Matrix4是一个4D矩阵，通过它我们可以实现各种矩阵操作
        transform: Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.deepOrange,
          child: const Text('Apartment for rent!'),
        ),
      ),
    );
  }
}
class Demo2 extends Data{
  @override
  void init() {
    title="translate";
    code = '''
//平移
DecoratedBox(
  decoration:const BoxDecoration(color: Colors.red),
  //默认原点为左上角，左移20像素，向上平移5像素
  child: Transform.translate(
    offset: const Offset(-20.0, -5.0),
    child: const Text("Hello world"),
  ),
)
''';
    ui = DecoratedBox(
      decoration:const BoxDecoration(color: Colors.red),
      //默认原点为左上角，左移20像素，向上平移5像素
      child: Transform.translate(
        offset: const Offset(-20.0, -5.0),
        child: const Text("Hello world"),
      ),
    );
  }
}

class Demo3 extends Data{
  @override
  void init() {
    title="rotate";
    code = '''
//旋转
DecoratedBox(
  decoration:const BoxDecoration(color: Colors.red),
  child: Transform.rotate(
    //旋转90度
    angle:math.pi/2 ,
    child: const Text("Hello world"),
  ),
)
''';
    ui = DecoratedBox(
      decoration:const BoxDecoration(color: Colors.red),
      child: Transform.rotate(
        //旋转90度
        angle:math.pi/2 ,
        child: const Text("Hello world"),
      ),
    );
  }
}

class Demo4 extends Data{
  @override
  void init() {
    title="scale";
    code = '''
//缩放
DecoratedBox(
    decoration:const BoxDecoration(color: Colors.red),
    child: Transform.scale(
        scale: 1.5, //放大到1.5倍
        child: const Text("Hello world")
    )
)
''';
    ui = DecoratedBox(
        decoration:const BoxDecoration(color: Colors.red),
        child: Transform.scale(
            scale: 1.5, //放大到1.5倍
            child: const Text("Hello world")
        )
    );
  }
}
