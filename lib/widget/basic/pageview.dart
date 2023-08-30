import 'package:flutter/material.dart';

import '../../main.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      Demo1()..init(),
      Demo2()..init(),
    ]);
  }

}
class Demo1 extends Data{
  @override
  void init() {
    title="default";
    code = '''
PageView(
  // scrollDirection: Axis.vertical, // 滑动方向为垂直方向
  children: <Widget>[
    for (int i = 0; i < 6; ++i)
      PageCache( text: '\$i'),
  ],
)

// Tab 页面
class PageCache extends StatefulWidget {
  const PageCache({
    Key? key,
    required this.text
  }) : super(key: key);

  final String text;

  @override
  State<PageCache> createState() => _PageStateCache();
}

//使用缓存模式继承AutomaticKeepAliveClientMixin
class _PageStateCache extends State<PageCache> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    debugPrint("build \${widget.text}");
    return Center(child: Text(widget.text, textScaleFactor: 5));
  }

  /*
    当 keepAlive 标记为 false 时，如果列表项滑出加载区域时，列表组件将会被销毁。
    当 keepAlive 标记为 true 时，当列表项滑出加载区域后，Viewport 会将列表组件缓存起来；当列表项进入加载区域时，Viewport 从先从缓存中查找是否已经缓存，如果有则直接复用，如果没有则重新创建列表项。
   */
  @override
  bool get wantKeepAlive => true;
}
''';
    ui = PageView(
      // scrollDirection: Axis.vertical, // 滑动方向为垂直方向
      children: <Widget>[
        for (int i = 0; i < 6; ++i)
          PageCache( text: '$i'),
      ],
    );
  }
}
class Demo2 extends Data{
  @override
  void init() {
    title="custom";
    code = '''
//自定义缓存包装器
class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper({
    Key? key,
    this.keepAlive = true,
    required this.child,
  }) : super(key: key);
  final bool keepAlive;
  final Widget child;

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  void didUpdateWidget(covariant KeepAliveWrapper oldWidget) {
    if(oldWidget.keepAlive != widget.keepAlive) {
      // keepAlive 状态需要更新，实现在 AutomaticKeepAliveClientMixin 中
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
class Page extends StatefulWidget {
  const Page({
    Key? key,
    required this.text
  }) : super(key: key);

  final String text;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    debugPrint("build \${widget.text}");
    return Center(child: Text(widget.text, textScaleFactor: 5));
  }
}
''';
    ui = PageView(
      // scrollDirection: Axis.vertical, // 滑动方向为垂直方向
      children: <Widget>[
        for (int i = 0; i < 6; ++i)
          KeepAliveWrapper(child:Page( text: '$i')),
      ],
    );
  }
}

// Tab 页面
class PageCache extends StatefulWidget {
  const PageCache({
    Key? key,
    required this.text
  }) : super(key: key);

  final String text;

  @override
  State<PageCache> createState() => _PageStateCache();
}

//使用缓存模式继承AutomaticKeepAliveClientMixin
class _PageStateCache extends State<PageCache> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
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


//自定义缓存包装器
class KeepAliveWrapper extends StatefulWidget {
  const KeepAliveWrapper({
    Key? key,
    this.keepAlive = true,
    required this.child,
  }) : super(key: key);
  final bool keepAlive;
  final Widget child;

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  void didUpdateWidget(covariant KeepAliveWrapper oldWidget) {
    if(oldWidget.keepAlive != widget.keepAlive) {
      // keepAlive 状态需要更新，实现在 AutomaticKeepAliveClientMixin 中
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
class Page extends StatefulWidget {
  const Page({
    Key? key,
    required this.text
  }) : super(key: key);

  final String text;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    debugPrint("build ${widget.text}");
    return Center(child: Text(widget.text, textScaleFactor: 5));
  }
}