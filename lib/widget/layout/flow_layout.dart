import 'package:flutter/material.dart';

import '../../main.dart';

class FlowLayout extends StatelessWidget {
  const FlowLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      FlowWidget()..init(),
    ]);
  }

}

class FlowWidget extends Data{
  @override
  void init() {
    ui = Flow(
      delegate: FlowDelegateLayout(margin: const EdgeInsets.all(10.0)), //自定义动画
      children: <Widget>[
        Container(width: 80.0, height:80.0, color: Colors.red,),
        Container(width: 80.0, height:80.0, color: Colors.green,),
        Container(width: 80.0, height:80.0, color: Colors.blue,),
        Container(width: 80.0, height:80.0,  color: Colors.yellow,),
        Container(width: 80.0, height:80.0, color: Colors.brown,),
        Container(width: 80.0, height:80.0,  color: Colors.purple,),
      ],
    );
    title="Flow";
    code = '''
//流式布局
//我们一般很少会使用Flow，因为其过于复杂，需要自己实现子 widget 的位置转换，在很多场景下首先要考虑的是Wrap是否满足需求。
// Flow主要用于一些需要自定义布局策略或性能要求较高(如动画中)的场景。
// 优点：性能好，灵活
// 缺点：使用复杂，不能自适应子组件大小，必须通过指定父容器大小或实现TestFlowDelegate的getSize返回固定大小。
Flow(
  delegate: FlowDelegateLayout(margin: const EdgeInsets.all(10.0)), //自定义动画
  children: <Widget>[
    Container(width: 80.0, height:80.0, color: Colors.red,),
    Container(width: 80.0, height:80.0, color: Colors.green,),
    Container(width: 80.0, height:80.0, color: Colors.blue,),
    Container(width: 80.0, height:80.0,  color: Colors.yellow,),
    Container(width: 80.0, height:80.0, color: Colors.brown,),
    Container(width: 80.0, height:80.0,  color: Colors.purple,),
  ],
)    

class FlowDelegateLayout extends FlowDelegate {
  EdgeInsets margin;

  FlowDelegateLayout({this.margin = EdgeInsets.zero});

  double width = 0;
  double height = 0;

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 指定Flow的大小，简单起见我们让宽度竟可能大，但高度指定为200，
    // 实际开发中我们需要根据子元素所占用的具体宽高来设置Flow大小
    return const Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
''';
  }
}

class FlowDelegateLayout extends FlowDelegate {
  EdgeInsets margin;

  FlowDelegateLayout({this.margin = EdgeInsets.zero});

  double width = 0;
  double height = 0;

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 指定Flow的大小，简单起见我们让宽度竟可能大，但高度指定为200，
    // 实际开发中我们需要根据子元素所占用的具体宽高来设置Flow大小
    return const Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}