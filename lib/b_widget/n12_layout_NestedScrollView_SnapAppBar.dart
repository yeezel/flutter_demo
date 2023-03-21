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
          child: SnapAppBar(),
        ),
      )
    );
  }
}

class SnapAppBar extends StatefulWidget {
  const SnapAppBar({Key? key}) : super(key: key);

  @override
  State<SnapAppBar> createState() => _SnapAppBar2State();
}

class _SnapAppBar2State extends State<SnapAppBar> {
  // 将handle 缓存
  late SliverOverlapAbsorberHandle handle;

  void onOverlapChanged(){
    // 打印 overlap length
    debugPrint(handle.layoutExtent.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          handle = NestedScrollView.sliverOverlapAbsorberHandleFor(context);
          //添加监听前先移除旧的
          handle.removeListener(onOverlapChanged);
          //overlap长度发生变化时打印
          handle.addListener(onOverlapChanged);
          return <Widget>[
            SliverOverlapAbsorber(
              handle: handle,
              sliver: SliverAppBar(
                floating: true,
                snap: true,
                // pinned: true,  // 放开注释，然后看日志
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "static/imgs/avatar.png",
                    fit: BoxFit.cover,
                  ),
                ),
                forceElevated: innerBoxIsScrolled,
              ),
            ),
          ];
        },
        body: LayoutBuilder(builder: (BuildContext context,cons) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverOverlapInjector(handle: handle),
              buildSliverList(100)
            ],
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    // 移除监听器
    handle.removeListener(onOverlapChanged);
    super.dispose();
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
