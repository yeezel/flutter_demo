import 'package:flutter/material.dart';

import 'n10_layout_pageview_cache_custom.dart';

//组合（协调）两个可滚动组件
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
          child: MyNestedScrollView(),
        ),
      )
    );
  }
}

class MyNestedScrollView extends StatelessWidget {
  const MyNestedScrollView({super.key});
  @override
  Widget build(BuildContext context) {
    // 使用
    return NestedScrollView(
      //外部可滚动组件，只能接收 Sliver 滚动组件
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        // 返回一个 Sliver 数组给外部可滚动组件。
        return <Widget>[
          SliverAppBar(
            title: const Text('嵌套ListView'),
            pinned: true, // 固定在顶部
            forceElevated: innerBoxIsScrolled,
          ),
          buildSliverList(5), //构建一个 sliverList
        ];
      },
      //内部可滚动组件，接收任意可滚动组件
      //注意点一：
      //要确认内部的可滚动组件（body）的 physics 是否需要设置为 ClampingScrollPhysics。
      // 比如上面的示例运行在 iOS 中时，ListView 如果没有设置为 ClampingScrollPhysics，则用户快速滑动到顶部时，
      // 会执行一个弹性效果，此时 ListView 就会与 header 显得割裂（滑动效果不统一），所以需要设置。
      // 但是，如果 header 中只有一个 SliverAppBar 则不应该加，因为 SliverAppBar 是固定在顶部的，
      // ListView 滑动到顶部时上面已经没有要继续往下滑动的元素了，所以此时出现弹性效果是符合预期的。
      //注意点二：
      // 内部的可滚动组件（body的）不能设置 controller 和 primary，
      // 这是因为 NestedScrollView 的协调器中已经指定了它的 controller，
      // 如果重新设定则协调器将会失效。
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        physics: const ClampingScrollPhysics(), //重要
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 50,
            child: Center(child: Text('Item $index')),
          );
        },
      ),
    );
  }

  buildSliverList(int count) {
    // SliverFixedExtentList 是一个 Sliver，它可以生成高度相同的列表项。
    // 再次提醒，如果列表项高度相同，我们应该优先使用SliverFixedExtentList
    // 和 SliverPrototypeExtentList，如果不同，使用 SliverList.
    return SliverFixedExtentList(
      itemExtent: 56, //列表项高度固定
      delegate: SliverChildBuilderDelegate(
            (_, index) => ListTile(title: Text('$index')),
        childCount: count,
      ),
    );
  }
}