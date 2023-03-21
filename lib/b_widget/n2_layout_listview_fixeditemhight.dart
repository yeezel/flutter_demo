import 'package:flutter/material.dart';

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
      home: const Scaffold(
        body: Center(
          child: FixedExtentList(),
        ),
      ),
    );
  }
}
//当我们知道列表项的高度都相同时，强烈建议指定 itemExtent 或 prototypeItem
class FixedExtentList extends StatelessWidget {
  const FixedExtentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //如果我们知道列表中的所有列表项长度都相同但不知道具体是多少，这时我们可以指定一个列表项，
      // 该列表项被称为 prototypeItem（列表项原型）。
      // 指定 prototypeItem 后，可滚动组件会在 layout 时计算一次它延主轴方向的长度，
      // 这样也就预先知道了所有列表项的延主轴方向的长度，所以和指定 itemExtent 一样，指定 prototypeItem 会有更好的性能。
      // 注意，itemExtent 和prototypeItem 互斥，不能同时指定它们。
      prototypeItem: const ListTile(title: Text("1")),
      //比让子组件自己决定自身长度会有更好的性能，这是因为指定itemExtent后，滚动系统可以提前知道列表的长度，
      // 而无需每次构建子组件时都去再计算一下，尤其是在滚动位置频繁变化时（滚动系统需要频繁去计算列表高度）。
      // 知道实际高度则可使用itemExtent参数填写具体值
      //itemExtent: 48,
      itemBuilder: (context, index) {
        //LayoutLogPrint是一个自定义组件，在布局时可以打印当前上下文中父组件给子组件的约束信息
        return LayoutLogPrint(
          tag: index,
          child: ListTile(title: Text("$index")),
        );
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