import 'package:flutter/material.dart';

import '../../framework/page/data.dart';
import '../../framework/page/widget_page.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      Demo1()..init(),
      Demo2()..init(),
      Demo3()..init(),
      Demo4()..init(),
      Demo5()..init(),
    ]);
  }

}
class Demo1 extends Data{
  @override
  void init() {
    title="SliverGridDelegateWithFixedCrossAxisCount";
    code = '''
GridView(
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
)
''';
    ui = GridView(
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
    );
  }
}
class Demo2 extends Data{
  @override
  void init() {
    title="SliverGridDelegateWithMaxCrossAxisExtent";
    code = '''
GridView(
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
''';
    ui = GridView(
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
    );
  }
}
class Demo3 extends Data{
  @override
  void init() {
    title="GridView.count";
    code = '''
//GridView.count构造函数内部使用了SliverGridDelegateWithFixedCrossAxisCount，我们通过它可以快速的创建横轴固定数量子元素的GridView
GridView.count(
  //横轴子元素的数量。
  // 此属性值确定后子元素在横轴的长度就确定了，即ViewPort横轴长度除以crossAxisCount的商。
  crossAxisCount: 3,
  //子元素在横轴长度和主轴长度的比例。
  // 由于crossAxisCount指定后，子元素横轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度。
  childAspectRatio: 1.0,
  children: const <Widget>[
    Icon(Icons.ac_unit),
    Icon(Icons.airport_shuttle),
    Icon(Icons.all_inclusive),
    Icon(Icons.beach_access),
    Icon(Icons.cake),
    Icon(Icons.free_breakfast),
  ],
)
''';
    ui = GridView.count(
      //横轴子元素的数量。
      // 此属性值确定后子元素在横轴的长度就确定了，即ViewPort横轴长度除以crossAxisCount的商。
      crossAxisCount: 3,
      //子元素在横轴长度和主轴长度的比例。
      // 由于crossAxisCount指定后，子元素横轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度。
      childAspectRatio: 1.0,
      children: const <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );
  }
}
class Demo4 extends Data{
  @override
  void init() {
    title="GridView.extent";
    code = '''
//GridView.extent构造函数内部使用了SliverGridDelegateWithMaxCrossAxisExtent，我们通过它可以快速的创建横轴子元素为固定最大长度的的GridView
GridView.extent(
  //子元素在横轴上的最大长度，之所以是“最大”长度，是因为横轴方向每个子元素的长度仍然是等分的
  maxCrossAxisExtent: 120.0,
  childAspectRatio: 2.0,
  children: const <Widget>[
    Icon(Icons.ac_unit),
    Icon(Icons.airport_shuttle),
    Icon(Icons.all_inclusive),
    Icon(Icons.beach_access),
    Icon(Icons.cake),
    Icon(Icons.free_breakfast),
  ],
)
''';
    ui = GridView.extent(
      //子元素在横轴上的最大长度，之所以是“最大”长度，是因为横轴方向每个子元素的长度仍然是等分的
      maxCrossAxisExtent: 120.0,
      childAspectRatio: 2.0,
      children: const <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );
  }
}
class Demo5 extends Data{
  @override
  void init() {
    title="GridView.builder";
    code = '''
//GridView.builder可动态创建子widget，适合子widget比较多情况
class InfiniteGridView extends StatefulWidget {
  const InfiniteGridView({super.key});

  @override
  State<InfiniteGridView> createState() => _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {
  final List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    super.initState();
    // 初始化数据
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, //每行三列
        childAspectRatio: 1.0, //显示区域宽高相等
      ),
      itemCount: _icons.length,
      itemBuilder: (context, index) {
        //如果显示到最后一个并且Icon总数小于200时继续获取数据
        if (index == _icons.length - 1 && _icons.length < 200) {
          _retrieveIcons();
        }
        return Icon(_icons[index]);
      },
    );
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(const Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast,
        ]);
      });
    });
  }
}
''';
    ui = const InfiniteGridView();
  }
}

class InfiniteGridView extends StatefulWidget {
  const InfiniteGridView({super.key});

  @override
  State<InfiniteGridView> createState() => _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {
  final List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    super.initState();
    // 初始化数据
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, //每行三列
        childAspectRatio: 1.0, //显示区域宽高相等
      ),
      itemCount: _icons.length,
      itemBuilder: (context, index) {
        //如果显示到最后一个并且Icon总数小于200时继续获取数据
        if (index == _icons.length - 1 && _icons.length < 200) {
          _retrieveIcons();
        }
        return Icon(_icons[index]);
      },
    );
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(const Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast,
        ]);
      });
    });
  }
}