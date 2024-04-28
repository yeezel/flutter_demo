import 'package:flutter/material.dart';

import '../../framework/page/data.dart';
import '../../framework/page/widget_page.dart';
class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      Demo1()..init(),
    ]);
  }

}
//页面骨架
/*
实例:
    一个导航栏
    导航栏右边有一个分享按钮
    有一个抽屉菜单
    有一个底部导航
    右下角有一个悬浮的动作按钮

组件名称 	解释
AppBar 	一个导航栏骨架
MyDrawer 	抽屉菜单
BottomNavigationBar 	底部导航栏
FloatingActionButton 	漂浮按钮
 */
class ScaffoldRoute extends StatefulWidget {
  const ScaffoldRoute({super.key});

  @override
  State<ScaffoldRoute> createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
        AppBar({
          Key? key,
          this.leading, //导航栏最左侧Widget，默认为抽屉菜单按钮或返回按钮。
          this.automaticallyImplyLeading = true, //如果leading为null，是否自动实现默认的leading按钮
          this.title,// 页面标题
          this.actions, // 导航栏右侧菜单
          this.bottom, // 导航栏底部菜单，通常为Tab按钮组
          this.elevation = 4.0, // 导航栏阴影
          this.centerTitle, //标题是否居中
          this.backgroundColor,
          ...   //其他属性见源码注释
        })
       */
      appBar: AppBar( //导航栏
        title: const Text("App Name"),
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
        actions: <Widget>[ //导航栏右侧菜单
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        ],
      ),
      drawer: const MyDrawer(), //抽屉
      bottomNavigationBar: BottomNavigationBar( // 底部导航
        //隐藏label
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Hocon: Texme'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      //BottomAppBar 组件可以和FloatingActionButton配合实现“打洞”效果
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.white,
      //   shape: const CircularNotchedRectangle(), // 设置外形，底部导航栏打一个圆形的洞
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       IconButton(icon: const Icon(Icons.home), onPressed: () {  },),
      //       const SizedBox(), //中间位置空出，打洞用的位置
      //       IconButton(icon: const Icon(Icons.business), onPressed: () {  },),
      //     ], //均分底部导航栏横向空间
      //   ),
      // ),
      // 设置floatingActionButton到菜单栏位置才会出现打洞效果
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton( //悬浮按钮
          onPressed:_onAdd, //悬浮按钮
          child: const Icon(Icons.add)
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onAdd(){
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "static/imgs/avatar.png",
                        width: 80,
                      ),
                    ),
                  ),
                  const Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Add account'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Demo1 extends Data{
  @override
  void init() {
    title="default";
    code = '''
//页面骨架
/*
实例:
    一个导航栏
    导航栏右边有一个分享按钮
    有一个抽屉菜单
    有一个底部导航
    右下角有一个悬浮的动作按钮

组件名称 	解释
AppBar 	一个导航栏骨架
MyDrawer 	抽屉菜单
BottomNavigationBar 	底部导航栏
FloatingActionButton 	漂浮按钮
 */
class ScaffoldRoute extends StatefulWidget {
  const ScaffoldRoute({super.key});

  @override
  State<ScaffoldRoute> createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
        AppBar({
          Key? key,
          this.leading, //导航栏最左侧Widget，默认为抽屉菜单按钮或返回按钮。
          this.automaticallyImplyLeading = true, //如果leading为null，是否自动实现默认的leading按钮
          this.title,// 页面标题
          this.actions, // 导航栏右侧菜单
          this.bottom, // 导航栏底部菜单，通常为Tab按钮组
          this.elevation = 4.0, // 导航栏阴影
          this.centerTitle, //标题是否居中
          this.backgroundColor,
          ...   //其他属性见源码注释
        })
       */
      appBar: AppBar( //导航栏
        title: const Text("App Name"),
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
        actions: <Widget>[ //导航栏右侧菜单
          IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        ],
      ),
      drawer: const MyDrawer(), //抽屉
      bottomNavigationBar: BottomNavigationBar( // 底部导航
        //隐藏label
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Hocon: Texme'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      //BottomAppBar 组件可以和FloatingActionButton配合实现“打洞”效果
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.white,
      //   shape: const CircularNotchedRectangle(), // 设置外形，底部导航栏打一个圆形的洞
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       IconButton(icon: const Icon(Icons.home), onPressed: () {  },),
      //       const SizedBox(), //中间位置空出，打洞用的位置
      //       IconButton(icon: const Icon(Icons.business), onPressed: () {  },),
      //     ], //均分底部导航栏横向空间
      //   ),
      // ),
      // 设置floatingActionButton到菜单栏位置才会出现打洞效果
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton( //悬浮按钮
          onPressed:_onAdd, //悬浮按钮
          child: const Icon(Icons.add)
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onAdd(){
  }
}
''';
    ui = const ScaffoldRoute();
  }
}
