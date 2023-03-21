import 'package:flutter/material.dart';

//AnimatedList 和 ListView 的功能大体相似，不同的是，
// AnimatedList 可以在列表中插入或删除节点时执行一个动画，在需要添加或删除列表项的场景中会提高用户体验。
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
      home: Scaffold(
        body: Center(
            child: GridView(
              padding: EdgeInsets.zero,
              //该子类实现了一个横轴子元素为固定最大长度的layout算法
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  //子元素在横轴上的最大长度，之所以是“最大”长度，是因为横轴方向每个子元素的长度仍然是等分的
                  maxCrossAxisExtent: 120.0,
                  childAspectRatio: 1.0 //宽高比为2
              ),
              children: const <Widget>[
                Icon(Icons.ac_unit),
                Icon(Icons.airport_shuttle),
                Icon(Icons.all_inclusive),
                Icon(Icons.beach_access),
                Icon(Icons.cake),
                Icon(Icons.free_breakfast),
              ],
            )
        ),
      ),
    );
  }
}