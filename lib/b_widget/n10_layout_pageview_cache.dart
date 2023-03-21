import 'package:flutter/material.dart';

//pageview缓存，但是使用自定义pageview构建页面时没有给列表项包装 AutomaticKeepAlive 父组件，该方案会报错
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    // 生成 6 个 Tab 页
    for (int i = 0; i < 6; ++i) {
      children.add( Page( text: '$i'));
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: PageView(
          // scrollDirection: Axis.vertical, // 滑动方向为垂直方向
          children: children,
        )
      ),
    );
  }
}
// Tab 页面
class Page extends StatefulWidget {
  const Page({
    Key? key,
    required this.text
  }) : super(key: key);

  final String text;

  @override
  State<Page> createState() => _PageState();
}

//使用缓存模式继承AutomaticKeepAliveClientMixin
class _PageState extends State<Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);// 使用缓存必须调用
    debugPrint("build ${widget.text}");
    return Center(child: Text(widget.text, textScaleFactor: 5));
  }

  /*
    当 keepAlive 标记为 false 时，如果列表项滑出加载区域时，列表组件将会被销毁。
    当 keepAlive 标记为 true 时，当列表项滑出加载区域后，Viewport 会将列表组件缓存起来；当列表项进入加载区域时，Viewport 从先从缓存中查找是否已经缓存，如果有则直接复用，如果没有则重新创建列表项。
   */
  @override
  bool get wantKeepAlive => true;
}
