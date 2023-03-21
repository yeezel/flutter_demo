import 'package:flutter/material.dart';

//滚动监听
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
        body: Center(child: ScrollNotificationTestRoute()),
      ),
    );
  }
}

class ScrollNotificationTestRoute extends StatefulWidget {
  const ScrollNotificationTestRoute({super.key});

  @override
  State<ScrollNotificationTestRoute> createState() =>
      ScrollNotificationTestRouteState();
}

class ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = "0%"; //保存进度百分比

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
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
