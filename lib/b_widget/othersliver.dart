import 'package:flutter/material.dart';

import 'main.dart';

class Demo1 extends Data{
  @override
  void init() {
    title="fontFamily";
    code = '''
//可以将 RenderBox 适配为 Sliver
//如果 CustomScrollView 有孩子也是一个完整的可滚动组件且它们的滑动方向一致，则 CustomScrollView 不能正常工作
//要解决这个问题，可以使用 NestedScrollView
class OtherSliveRoute extends StatelessWidget {
  const OtherSliveRoute({super.key});

  @override
  Widget build(BuildContext context) {
    // 因为本路由没有使用 Scaffold，为了让子级Widget(如Text)使用
    // Material Design 默认的样式风格,我们使用 Material 作为本路由的根。
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Material(
          child: CustomScrollView(
            slivers: <Widget>[
              // AppBar，包含一个导航栏.
              SliverAppBar(
                pinned: true, // 滑动到顶端时会固定住
                expandedHeight: 250.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text('Demo'),
                  background: Image.asset(
                    "static/imgs/avatar.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverGrid(
                  //Grid
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //Grid按两列显示
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 4.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      //创建子widget
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.cyan[100 * (index % 9)],
                        child: Text('grid item \$index'),
                      );
                    },
                    childCount: 20,
                  ),
                ),
              ),
              SliverFixedExtentList(
                itemExtent: 50.0,
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    //创建列表项
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.lightBlue[100 * (index % 9)],
                      child: Text('list item \$index'),
                    );
                  },
                  childCount: 20,
                ),
              ),
            ],
          ),
        ),
      );
  }
}
''';
    ui = const OtherSliveRoute();
  }
}

class OtherSliveWidget extends Datas {
  @override
  void init() {
    title = "OtherSlive";
    list.add(Demo1()..init());
  }
}
class OtherSliveRoute extends StatelessWidget {
  const OtherSliveRoute({super.key});

  @override
  Widget build(BuildContext context) {
    // 因为本路由没有使用 Scaffold，为了让子级Widget(如Text)使用
    // Material Design 默认的样式风格,我们使用 Material 作为本路由的根。
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Material(
          child: CustomScrollView(
            slivers: <Widget>[
              // AppBar，包含一个导航栏.
              SliverAppBar(
                pinned: true, // 滑动到顶端时会固定住
                expandedHeight: 250.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text('Demo'),
                  background: Image.asset(
                    "static/imgs/avatar.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverGrid(
                  //Grid
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //Grid按两列显示
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 4.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      //创建子widget
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.cyan[100 * (index % 9)],
                        child: Text('grid item $index'),
                      );
                    },
                    childCount: 20,
                  ),
                ),
              ),
              SliverFixedExtentList(
                itemExtent: 50.0,
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    //创建列表项
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.lightBlue[100 * (index % 9)],
                      child: Text('list item $index'),
                    );
                  },
                  childCount: 20,
                ),
              ),
            ],
          ),
        ),
      );
  }
}
