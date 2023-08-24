import 'package:flutter/material.dart';

import 'main.dart';

class Demo1 extends Data{
  @override
  void init() {
    title="default";
    code = '''
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
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
            child: PageView(
              children: const [
                Text("hello",style: TextStyle(fontSize: 50)),
                Text("world",style: TextStyle(fontSize: 50))
              ],
            ),
          ),
        ),
        listView,
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

class SliverToBoxAdapterWidget extends Datas {
  @override
  void init() {
    title = "SliverToBoxAdapter";
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
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
            child: PageView(
              children: const [
                Text("hello",style: TextStyle(fontSize: 50)),
                Text("world",style: TextStyle(fontSize: 50))
              ],
            ),
          ),
        ),
        listView,
        listView,
        listView,
      ],
    );
  }
}