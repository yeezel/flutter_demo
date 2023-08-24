import 'package:flutter/material.dart';

import 'main.dart';

class Demo1 extends Data{
  @override
  void init() {
    title="default";
    code = '''
//将可滚动组件合成一个
//CustomScrollView 的主要功能是提供一个公共的的 Scrollable 和 Viewport，来组合多个 Sliver
//CustomScrollView 组合 Sliver 的原理是为所有子 Sliver 提供一个共享的 Scrollable，然后统一处理指定滑动方向的滑动事件。
//CustomScrollView 和 ListView、GridView、PageView 一样，都是完整的可滚动组件（同时拥有 Scrollable、Viewport、Sliver）。
//CustomScrollView 只能组合 Sliver，如果有孩子也是一个完整的可滚动组件（通过 SliverToBoxAdapter 嵌入）且它们的滑动方向一致时便不能正常工作。
class MyCustomScrollView extends StatelessWidget {
  const MyCustomScrollView({super.key});
  @override
  Widget build(BuildContext context) {
    // SliverFixedExtentList 是一个 Sliver，它可以生成高度相同的列表项。
    // 再次提醒，如果列表项高度相同，我们应该优先使用SliverFixedExtentList
    // 和 SliverPrototypeExtentList，如果不同，使用 SliverList.
    var listView = SliverFixedExtentList(
      itemExtent: 56, //列表项高度固定
      delegate: SliverChildBuilderDelegate(
            (_, index) => ListTile(title: Text('\$index')),
        childCount: 10,
      ),
    );
    // 使用
    return CustomScrollView(
      slivers: [
        listView,
        listView,
      ],
    );
  }
}
''';
    ui = const MyCustomScrollView();
  }
}

class CustomScrollViewWidget extends Datas {
  @override
  void init() {
    title = "CustomScrollView";
    list.add(Demo1()..init());
  }
}
class MyCustomScrollView extends StatelessWidget {
  const MyCustomScrollView({super.key});
  @override
  Widget build(BuildContext context) {
    // SliverFixedExtentList 是一个 Sliver，它可以生成高度相同的列表项。
    // 再次提醒，如果列表项高度相同，我们应该优先使用SliverFixedExtentList
    // 和 SliverPrototypeExtentList，如果不同，使用 SliverList.
    var listView = SliverFixedExtentList(
      itemExtent: 56, //列表项高度固定
      delegate: SliverChildBuilderDelegate(
            (_, index) => ListTile(title: Text('$index')),
        childCount: 10,
      ),
    );
    // 使用
    return CustomScrollView(
      slivers: [
        listView,
        listView,
      ],
    );
  }
}