import 'package:flutter/material.dart';

import '../../main.dart';

class ScrollNotificationWidget extends StatelessWidget {
  const ScrollNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      Demo1()..init(),
    ]);
  }

}
class Demo1 extends Data{
  @override
  void init() {
    title="default";
    code = '''
//滚动监听
class ScrollNotificationWidget extends Datas {
  @override
  void init() {
    title = "ScrollNotification";
    list.add(Demo1()..init());
  }
}
class ScrollNotificationRoute extends StatefulWidget {
  const ScrollNotificationRoute({super.key});

  @override
  State<ScrollNotificationRoute> createState() =>
      ScrollNotificationTestRouteState();
}

class ScrollNotificationTestRouteState
    extends State<ScrollNotificationRoute> {
  String _progress = "0%"; //保存进度百分比
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      //进度条
      // 监听滚动通知
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          /*
           ScrollMetrics notification.metrics
              pixels：当前滚动位置。
              maxScrollExtent：最大可滚动长度。
              extentBefore：滑出ViewPort顶部的长度；此示例中相当于顶部滑出屏幕上方的列表长度。
              extentInside：ViewPort内部长度；此示例中屏幕显示的列表部分的长度。
              extentAfter：列表中未滑入ViewPort部分的长度；此示例中列表底部未显示到屏幕范围部分的长度。
              atEdge：是否滑到了可滚动组件的边界（此示例中相当于列表顶或底部）。
           */
          double progress = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          //重新构建
          setState(() {
            _progress = "\${(progress * 100).toInt()}%";
          });
          debugPrint("BottomEdge: \${notification.metrics.extentAfter == 0}");
          return false;
          //return true; //放开此行注释后，进度条将失效
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
              controller: _scrollController,
              itemCount: 100,
              itemExtent: 50.0,
              itemBuilder: (context, index) => ListTile(title: Text("\$index")),
            ),
            CircleAvatar(
              //显示进度百分比
              radius: 30.0,
              backgroundColor: Colors.black54,
              child: Text(_progress),
            )
          ],
        ),
      ),
    );
  }
}
''';
    ui = const ScrollNotificationRoute();
  }
}
class ScrollNotificationRoute extends StatefulWidget {
  const ScrollNotificationRoute({super.key});

  @override
  State<ScrollNotificationRoute> createState() =>
      ScrollNotificationTestRouteState();
}

class ScrollNotificationTestRouteState
    extends State<ScrollNotificationRoute> {
  String _progress = "0%"; //保存进度百分比
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      //进度条
      // 监听滚动通知
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          /*
           ScrollMetrics notification.metrics
              pixels：当前滚动位置。
              maxScrollExtent：最大可滚动长度。
              extentBefore：滑出ViewPort顶部的长度；此示例中相当于顶部滑出屏幕上方的列表长度。
              extentInside：ViewPort内部长度；此示例中屏幕显示的列表部分的长度。
              extentAfter：列表中未滑入ViewPort部分的长度；此示例中列表底部未显示到屏幕范围部分的长度。
              atEdge：是否滑到了可滚动组件的边界（此示例中相当于列表顶或底部）。
           */
          double progress = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          //重新构建
          setState(() {
            _progress = "${(progress * 100).toInt()}%";
          });
          debugPrint("BottomEdge: ${notification.metrics.extentAfter == 0}");
          return false;
          //return true; //放开此行注释后，进度条将失效
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
              controller: _scrollController,
              itemCount: 100,
              itemExtent: 50.0,
              itemBuilder: (context, index) => ListTile(title: Text("$index")),
            ),
            CircleAvatar(
              //显示进度百分比
              radius: 30.0,
              backgroundColor: Colors.black54,
              child: Text(_progress),
            )
          ],
        ),
      ),
    );
  }
}
