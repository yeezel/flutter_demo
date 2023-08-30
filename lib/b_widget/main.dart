import 'package:flutter/material.dart';
import 'package:flutter_demo/b_widget/padding_edgeInsets.dart';
import 'package:flutter_demo/b_widget/pageview.dart';
import 'package:flutter_demo/b_widget/rotatedbox.dart';
import 'package:flutter_demo/b_widget/scrollcontroller.dart';
import 'package:flutter_demo/b_widget/switch_checkbox.dart';
import 'package:flutter_demo/b_widget/tabbarview.dart';
import 'package:flutter_demo/b_widget/theme.dart';
import 'package:flutter_demo/b_widget/transform.dart';

import 'BottomNavigationBar.dart';
import 'CustomScrollView.dart';
import 'CustomSliverFlexibleHeader.dart';
import 'DecoratedBox.dart';
import 'DropdownButton.dart';
import 'Form.dart';
import 'NestedScrollView.dart';
import 'SliverToBoxAdapter.dart';
import 'TextField.dart';
import 'button.dart';
import 'clip.dart';
import 'color.dart';
import 'container.dart';
import 'dialog.dart';
import 'fittedbox.dart';
import 'gridview.dart';
import 'icon.dart';
import 'font.dart';
import 'image.dart';
import 'layout.dart';
import 'listview.dart';
import 'animatedList.dart';
import 'SliverPersistentHeader.dart';
import 'CustomSliverPersistentHeaderToBox.dart';
import 'motion_toast.dart';
import 'notificationListener.dart';
import 'othersliver.dart';
import 'singlechildscrollview.dart';
import 'scaffold.dart';
import 'progress.dart';
import 'text.dart';

void main() => runApp(const LearnFlutterWidgetApp());

abstract class Datas{
  late BuildContext context;
  String title="";
  List<Data> list=[];
  void init();
}
abstract class Data{
  String title="";
  String code="";
  late Widget ui;
  void init();
}
List<Datas> datas = [
  // LayoutWidget()..init(),
  // TextWidget()..init(),
  // FontWidget()..init(),
  // ButtonWidget()..init(),
  // MotionToastWidget()..init(),
  // DropdownButtonWidget()..init(),
  // ImageWidget()..init(),
  // IconWidget()..init(),
  // TextFieldWidget()..init(),
  // FormWidget()..init(),
  // SwitchCheckBoxWidget()..init(),
  // ProgressWidget()..init(),
  // DialogWidget()..init(),
  // ListViewWidget()..init(),
  // AnimatedListWidget()..init(),
  // GridViewWidget()..init(),
  // PageViewWidget()..init(),
  // TabBarViewWidget()..init(),

  NestedScrollViewWidget()..init(),
  CustomScrollViewWidget()..init(),
  OtherSliveWidget()..init(),
  SliverPersistentHeaderWidget()..init(),
  SliverToBoxAdapterWidget()..init(),
  CustomSliverFlexibleHeaderWidget()..init(),
  // CustomSliverPersistentHeaderToBoxWidget()..init(), //报错，待查询原因
  SingleChildScrollViewWidget()..init(),
  ScrollControllerWidget()..init(),
  ScrollNotificationWidget()..init(),

  // ThemeWidget()..init(),
  // ColorWidget()..init(),
  // PaddingEdgeInsetsWidget()..init(),
  // DecoratedBoxWidget()..init(),
  // TransformWidget()..init(),
  // RotatedboxWidget()..init(),
  // ContainerWidget()..init(),
  // ClipWidget()..init(),
  // FittedBoxWidget()..init(),
  // ScaffoldWidget()..init(),
  // BottomNavigationBarWidget()..init(),
];
class LearnFlutterWidgetApp extends StatefulWidget {
  const LearnFlutterWidgetApp({super.key});
  @override
  LearnFlutterWidgetAppState createState() => LearnFlutterWidgetAppState();
}

class LearnFlutterWidgetAppState extends State<LearnFlutterWidgetApp> {
  List<Data> list=[];
  void setList(List<Data> list){
    setState(() {
      this.list = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar( //导航栏
          title: const Text("组件学习"),
          //自定义菜单图标
          leading: Builder(builder: (context) {
            return IconButton(
              icon: const Icon(Icons.dashboard, color: Colors.white), //自定义图标
              onPressed: () {
                // 打开抽屉菜单
                Scaffold.of(context).openDrawer();
              },
            );
          }),
        ),
        drawer: Drawer(
          width: 180,
          child: ListView(
            children: datas.map((e){
              return ListTile(
                title: Text(e.title),
                onTap: (){
                  setList(e.list);
                },
              );
            }).toList(),
          ),
        ),
        body: _WidgetPage(
            list: list
        ),
      ),
    );
  }
}

class _WidgetPage extends StatelessWidget {
  _WidgetPage({
    required this.list
  });
  List<Data> list;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: [
          for(var i = 0 ; i<list.length; i++)
            ...buildWidget(list[i]),
        ]
    );
  }
  List<Widget> buildWidget(Data data) {
    return [
      SliverPersistentHeader(
        pinned: true,
        delegate: SliverHeaderDelegate(
          maxHeight: 20,
          child: Container(
            color: Colors.lightBlue.shade200,
            alignment: Alignment.centerLeft,
            child: Text(data.title),
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
            // childAspectRatio: 2.0,
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  switch(index) {
                    case 1:
                      return Container(
                          alignment: Alignment.center,
                          child: data.ui
                      );
                    case 0:
                      return SizedBox(
                        child: Container(
                            alignment: Alignment.center,
                            color: Colors.cyan[100 * (1 % 9)],
                            child: SelectableText(
                              data.code,
                              style: const TextStyle(fontSize: 16),
                            )
                        ),
                      );
                  }
            },
            childCount: 2,
          ),
        ),
      ),
    ];
  }
}

typedef SliverHeaderBuilder = Widget Function(
    BuildContext context, double shrinkOffset, bool overlapsContent);

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  // child 为 header
  SliverHeaderDelegate({
    required this.maxHeight,
    this.minHeight = 0,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        assert(minHeight <= maxHeight && minHeight >= 0);

  //最大和最小高度相同
  SliverHeaderDelegate.fixedHeight({
    required double height,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        maxHeight = height,
        minHeight = height;

  //需要自定义builder时使用
  SliverHeaderDelegate.builder({
    required this.maxHeight,
    this.minHeight = 0,
    required this.builder,
  });

  final double maxHeight;
  final double minHeight;
  final SliverHeaderBuilder builder;

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    Widget child = builder(context, shrinkOffset, overlapsContent);
    //测试代码：如果在调试模式，且子组件设置了key，则打印日志
    assert(() {
      if (child.key != null) {
        debugPrint('${child.key}: shrink: $shrinkOffset，overlaps:$overlapsContent');
      }
      return true;
    }());
    // 让 header 尽可能充满限制的空间；宽度为 Viewport 宽度，
    // 高度随着用户滑动在[minHeight,maxHeight]之间变化。
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverHeaderDelegate old) {
    return old.maxExtent != maxExtent || old.minExtent != minExtent;
  }
}