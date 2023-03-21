import 'package:flutter/material.dart';

import 'n10_layout_pageview_cache_custom.dart';

//可以将 RenderBox 适配为 Sliver
//对应 AppBar，主要是为了在 CustomScrollView 中使用。
//如果 CustomScrollView 有孩子也是一个完整的可滚动组件且它们的滑动方向一致，则 CustomScrollView 不能正常工作
//要解决这个问题，可以使用 NestedScrollView
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
          child: MyCustomScrollView(),
        ),
      )
    );
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