import 'package:flutter/material.dart';

//GridView.builder可动态创建子widget，适合子widget比较多情况
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

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    debugPrint("build ${widget.text}");
    return Center(child: Text(widget.text, textScaleFactor: 5));
  }
}
