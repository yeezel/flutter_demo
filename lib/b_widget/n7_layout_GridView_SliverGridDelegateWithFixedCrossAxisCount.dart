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
                //该子类实现了一个横轴为固定数量子元素的layout算法
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //横轴子元素的数量。
                    // 此属性值确定后子元素在横轴的长度就确定了，即ViewPort横轴长度除以crossAxisCount的商。
                    crossAxisCount: 3, //横轴三个子widget
                    //子元素在横轴长度和主轴长度的比例。
                    // 由于crossAxisCount指定后，子元素横轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度。
                    childAspectRatio: 1.0
                ),
                children: const <Widget>[
                  Icon(Icons.ac_unit),
                  Icon(Icons.airport_shuttle),
                  Icon(Icons.all_inclusive),
                  Icon(Icons.beach_access),
                  Icon(Icons.cake),
                  Icon(Icons.free_breakfast)
                ]
            ),
        ),
      ),
    );
  }
}