import 'package:flutter/material.dart';

import '../../main.dart';

class NavigationRailWidget extends StatelessWidget {
  const NavigationRailWidget({super.key});

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
    title="NavigationRail";
    code = '''
Widget _buildLeftNavigation(int index){
    List<NavigationRailDestination> list = [];
    destinations.forEach((item, iconData) {
      list.add(NavigationRailDestination(
        icon: Icon(iconData),
        selectedIcon: Icon(iconData),
        label: Text(item),
      ));
    });
    const Color textColor =  Color(0xffcfd1d7);
    const  Color activeColor =  Colors.blue;
    const TextStyle labelStyle =  TextStyle(color: textColor,fontSize: 11);

    return NavigationRail(
      //导航菜单外的首尾组件 leading(首) 和 trailing(尾)
      leading: const Icon(Icons.menu_open,color: Colors.grey,),
      //控制是否展开侧边栏, true展开，false关闭
      extended: false,
      trailing: const Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: FlutterLogo(),
          ),
        ),
      ),
      //右侧会有阴影，该值越大，阴影越明显
      elevation: 51,
      // 用于折叠的时候显示样式，默认是 none ，也就是只显示图标，没有文字
      // 设置为 selected 时，只有激活的导航菜单会同时显示 图标 和 文字标签
      // 当 extended 属性为 true 时， labelType 必须为 NavigationRailLabelType.none 不然会报错
      labelType: NavigationRailLabelType.selected,

      backgroundColor: const Color(0xff324465), //背景
      unselectedIconTheme: const IconThemeData(color: textColor) , //未选中签文字样式
      selectedIconTheme: const IconThemeData(color: activeColor) , //选中标签文字样式
      unselectedLabelTextStyle: labelStyle, //未选中图标样式
      selectedLabelTextStyle: labelStyle, //选中图标样式

      //控制图标后面的背景指示器
      useIndicator : true, // 是否添加指示器
      indicatorColor : Colors.red  ,

      selectedIndex: index,
      onDestinationSelected: _onDestinationSelected,
      destinations: list,
    );
  }
''';
    ui = const NavigationRailDemo();
  }
}
class NavigationRailDemo extends StatefulWidget {
  const NavigationRailDemo({super.key});

  @override
  State<NavigationRailDemo> createState() => _NavigationRailDemoState();
}

class _NavigationRailDemoState extends State<NavigationRailDemo> {

  bool extended = false;
  NavigationRailLabelType labelType = NavigationRailLabelType.selected;

  final Map<String,IconData> destinations = {
    '消息':Icons.message_outlined,
    '视频会议':Icons.video_camera_back_outlined,
    '通讯录':Icons.book_outlined,
  };

  // 跳转界面
  final PageController _controller = PageController();
  final  ValueNotifier<int> _selectIndex = ValueNotifier(0);

  Widget _buildLeftNavigation(int index){
    List<NavigationRailDestination> list = [];
    destinations.forEach((item, iconData) {
      list.add(NavigationRailDestination(
        icon: Icon(iconData),
        selectedIcon: Icon(iconData),
        label: Text(item),
      ));
    });
    const Color textColor =  Color(0xffcfd1d7);
    const  Color activeColor =  Colors.blue;
    const TextStyle labelStyle =  TextStyle(color: textColor,fontSize: 11);

    return NavigationRail(
      //导航菜单外的首尾组件 leading(首) 和 trailing(尾)
      leading: TextButton(
        child: const Icon(Icons.menu_open,color: Colors.grey,),
        onPressed: () => setState(() {
          extended = !extended;
          if(extended) {
            labelType = NavigationRailLabelType.none;
          } else {
            labelType = NavigationRailLabelType.selected;
          }
        }),
      ),
      //控制是否展开侧边栏, true展开，false关闭
      extended: extended,
      trailing: const Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: FlutterLogo(),
          ),
        ),
      ),
      //右侧会有阴影，该值越大，阴影越明显
      elevation: 51,
      // 用于折叠的时候显示样式，默认是 none ，也就是只显示图标，没有文字
      // 设置为 selected 时，只有激活的导航菜单会同时显示 图标 和 文字标签
      // 当 extended 属性为 true 时， labelType 必须为 NavigationRailLabelType.none 不然会报错
      labelType: labelType,

      backgroundColor: const Color(0xff324465), //背景
      unselectedIconTheme: const IconThemeData(color: textColor) , //未选中签文字样式
      selectedIconTheme: const IconThemeData(color: activeColor) , //选中标签文字样式
      unselectedLabelTextStyle: labelStyle, //未选中图标样式
      selectedLabelTextStyle: labelStyle, //选中图标样式

      //控制图标后面的背景指示器
      useIndicator : true, // 是否添加指示器
      indicatorColor : Colors.red  ,

      selectedIndex: index,
      onDestinationSelected: _onDestinationSelected,
      destinations: list,
    );
  }

  void _onDestinationSelected(int value) {
    //TODO 更新索引 + 切换界面
    _controller.jumpToPage(value); // tag1
    _selectIndex.value = value; //tag2
  }

  @override
  Widget build(BuildContext context) {
    // NavigationRail 该组件一般在 Row 中，使用于 Scaffold.body 属性下
    return Scaffold(
      body: Row(
        children: [
          //监听 _selectIndex 实现局部更新构建
          ValueListenableBuilder<int>(
            valueListenable: _selectIndex,
            builder: (_,index,__)=>_buildLeftNavigation(index),
          ),
          Expanded(child: PageView(
            controller: _controller,
            children: [
              testContent('消息'),
              testContent('视频会议'),
              testContent('通讯录'),
            ],
          ))
        ],
      ),
    );
  }
  @override
  void dispose(){
    _controller.dispose();
    _selectIndex.dispose();
    super.dispose();
  }

  Widget testContent(String context){
    return Center(
      child: Text(
        context,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}


