import 'package:flutter/material.dart';

import '../../framework/page/data.dart';
import '../../framework/page/widget_page.dart';

class LayoutBuildLayout extends StatelessWidget {
  const LayoutBuildLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      LayoutBuildWidget()..init(),
    ]);
  }

}

class LayoutBuildWidget extends Data{
  @override
  void init() {
    ui = const LayoutBuilderRoute();
    title="layout build";
    code = '''
//实现一个响应式的 Column 组件 ResponsiveColumn，它的功能是当当前可用的宽度小于 200 时，将子组件显示为一列，否则显示为两列。
//使用场景：
//1. 可以使用 LayoutBuilder 来根据设备的尺寸来实现响应式布局。
//2. LayoutBuilder 可以帮我们高效排查问题。比如我们在遇到布局问题或者想调试组件树中某一个节点布局的约束时 LayoutBuilder 就很有用。
LayoutBuilder(
  builder: (BuildContext context, BoxConstraints constraints) {
    if (constraints.maxWidth < 200) {
      // 最大宽度小于200，显示单列
      return Column(mainAxisSize: MainAxisSize.min, children: children);
    } else {
      // 大于200，显示双列
      var children = <Widget>[];
      for (var i = 0; i < children.length; i += 2) {
        if (i + 1 < children.length) {
          children.add(Row(
            mainAxisSize: MainAxisSize.min,
            children: [children[i], children[i + 1]],
          ));
        } else {
          children.add(children[i]);
        }
      }
      return Column(mainAxisSize: MainAxisSize.min, children: children);
    }
  },
)
''';
  }
}

class LayoutBuilderRoute extends StatelessWidget {
  const LayoutBuilderRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var children = List.filled(4, const Text("A"));
    // Column在本示例中在水平方向的最大宽度为屏幕的宽度
    return Column(
      children: [
        // 限制宽度为190，小于 200
        SizedBox(
            width: 290,
            child: ResponsiveColumn(children: children)
        ),
        //打印布局时的约束信息
        const LayoutLogPrint(child:Text("xx"))
      ],
    );
  }
}

class ResponsiveColumn extends StatelessWidget {
  const ResponsiveColumn({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // 通过 LayoutBuilder 拿到父组件传递的约束，然后判断 maxWidth 是否小于200
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 200) {
          // 最大宽度小于200，显示单列
          return Column(mainAxisSize: MainAxisSize.max, children: children);
        } else {
          // 大于200，显示双列
          var childs = <Widget>[];
          for (var i = 0; i < children.length; i += 2) {
            if (i + 1 < children.length) {
              childs.add(Row(
                mainAxisSize: MainAxisSize.max,
                children: [children[i], children[i + 1]],
              ));
            } else {
              childs.add(children[i]);
            }
          }
          return Column(mainAxisSize: MainAxisSize.max, children: childs);
        }
      },
    );
  }
}

class LayoutLogPrint<T> extends StatelessWidget {
  const LayoutLogPrint({
    Key? key,
    this.tag,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final T? tag; //指定日志tag

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      // assert在编译release版本时会被去除
      assert(() {
        debugPrint('${tag ?? key ?? child}: $constraints');
        return true;
      }());
      return child;
    });
  }
}