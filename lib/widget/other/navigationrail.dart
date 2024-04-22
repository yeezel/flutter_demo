import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  //二级菜单面板使用oerlay
  final GlobalKey _navigationRailKey = GlobalKey();
  OverlayEntry? _overlayEntry;

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
      key:_navigationRailKey,
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
      indicatorColor : Colors.red,
      //修改背景图形
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(color: Colors.yellow,width: 2.0),
      ),

      selectedIndex: index,
      onDestinationSelected: _onDestinationSelected,
      destinations: list,
    );
  }
  // 添加二级菜单面板
  // 在Flutter中，Overlay是一个非常灵活的组件，它可以管理一堆可以独立管理的OverlayEntry对象。
  // 这些OverlayEntry对象可以让独立的子Widget在其他Widget上方“浮动”显示。
  // 创建OverlayEntry
  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = _navigationRailKey.currentContext?.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);
    return OverlayEntry(
      builder: (BuildContext context) => Positioned(
        left: offset.dx+size.width,
        top: offset.dy,
        width: size.width,
        height: size.height,
        child: Material(
          elevation: 4.0,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              const ListTile(title: Text('第一项')),
              const ListTile(title: Text('第二项')),
              ListTile(title: const Text('关闭'), onTap: () => _overlayEntry?.remove()),
            ],
          ),
        ),
      ),
    );
  }
  void _onDestinationSelected(int value) {
    //0开始，leading(首) 和 trailing(尾)不会触发该方法
    debugPrint("$value");
    //TODO 更新索引 + 切换界面
    _controller.jumpToPage(value); // tag1
    _selectIndex.value = value; //tag2
    // 添加二级菜单面板
    if(value==2){
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context)?.insert(_overlayEntry!);
    } else if(_overlayEntry.isBlank!){
      _overlayEntry?.remove();
    }
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


