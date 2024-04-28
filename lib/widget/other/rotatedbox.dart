import 'package:flutter/material.dart';

import '../../framework/page/data.dart';
import '../../framework/page/widget_page.dart';

class RotatedboxWidget extends StatelessWidget {
  const RotatedboxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      Demo1()..init(),
    ]);
  }

}

class Demo1 extends Data{
  @override
  void init() {
    title="RotatedBox";
    code = '''
//变换
//可以在其子组件绘制时对其应用一些矩阵变换来实现一些特效。
/*
RotatedBox和Transform.rotate功能相似，它们都可以对子组件进行旋转变换，
但是有一点不同：RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小。
 */
 
//RotatedBox在layout阶段
const Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      //将Transform.rotate换成RotatedBox
      child: RotatedBox(
        quarterTurns: 1, //旋转90度(1/4圈)
        child: Text("Hello world"),
      ),
    ),
    Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
  ],
)
''';
    ui = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Transform在绘制阶段
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                  decoration:const BoxDecoration(color: Colors.red),
                  child: Transform.scale(scale: 1.5,
                      child: const Text("Hello world")
                  )
              ),
              const Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
            ],
          ),
          const SizedBox(height: 50,),
          //RotatedBox在layout阶段
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                //将Transform.rotate换成RotatedBox
                child: RotatedBox(
                  quarterTurns: 1, //旋转90度(1/4圈)
                  child: Text("Hello world"),
                ),
              ),
              Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
            ],
          ),
        ],
      ),
    );
  }
}
