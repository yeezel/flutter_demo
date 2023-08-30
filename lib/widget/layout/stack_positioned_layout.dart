import 'package:flutter/material.dart';

import '../../main.dart';

class StackPositionLayout extends StatelessWidget {
  const StackPositionLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      StackPositionWidget()..init(),
    ]);
  }

}

class StackPositionWidget extends Data{
  @override
  void init() {
    ui = Stack(
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
    );
    title="StackPosition";
    code = '''
//层叠布局
//stack允许子组件堆叠，而Positioned用于根据Stack的四个角来确定子组件的位置
//这两个组件实现绝对定位
Stack(
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
)
''';
  }
}