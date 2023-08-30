import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/basic/button.dart';
import 'package:flutter_demo/widget/basic/color.dart';
import 'package:flutter_demo/widget/basic/font.dart';
import 'package:flutter_demo/widget/basic/image.dart';
import 'package:flutter_demo/widget/basic/text.dart';
import 'package:flutter_demo/widget/form/checkbox.dart';
import 'package:flutter_demo/widget/form/form.dart';
import 'package:flutter_demo/widget/form/switch.dart';

import 'other/Rsync_FutureBuilderFunc.dart';
import 'other/Rsync_StreamBuilder.dart';
import 'other/ValueListenableBuilder.dart';
import 'other/animation_AnimatedSwitcher.dart';
import 'other/animation_AnimatedWidget.dart';
import 'other/animation_AnimationControlle.dart';
import 'other/animation_base.dart';
import 'other/animation_custom.dart';
import 'other/animation_hero.dart';
import 'other/animation_otherwidget.dart';
import 'other/animation_router.dart';
import 'other/animation_statelistener.dart';
import 'other/custom_Checkbox.dart';
import 'other/custom_DoneWidget.dart';
import 'other/custom_GradientButton.dart';
import 'other/custom_GradientCircularProgress.dart';
import 'other/custom_WaterMark.dart';
import 'other/custom_paint.dart';
import 'other/custom_turnbox.dart';
import 'other/event_BothDirection.dart';
import 'other/event_EventBus.dart';
import 'other/event_GestureConflict.dart';
import 'other/event_GestureDetector.dart';
import 'other/event_GestureRecognizer.dart';
import 'other/event_Notification.dart';
import 'other/event_Notification_custom.dart';
import 'other/event_listener.dart';
import 'other/platform_channels.dart';
import 'other/willpopscope.dart';
import 'widget/basic/animated_list.dart';
import 'widget/basic/clip.dart';
import 'widget/basic/decoratedbox.dart';
import 'widget/basic/gridview.dart';
import 'widget/basic/listview.dart';
import 'widget/basic/padding_edgeInsets.dart';
import 'widget/basic/pageview.dart';
import 'widget/basic/tabbarview.dart';
import 'widget/basic/theme.dart';
import 'widget/form/dropdown_button.dart';
import 'widget/form/textfield.dart';
import 'widget/layout/align_layout.dart';
import 'widget/layout/box_layout.dart';
import 'widget/layout/center_layout.dart';
import 'widget/layout/container.dart';
import 'widget/layout/custom_layout.dart';
import 'widget/layout/flex_expanded_layout.dart';
import 'widget/layout/flow_layout.dart';
import 'widget/layout/layoutbuild_layout.dart';
import 'widget/layout/row_column_layout.dart';
import 'widget/layout/scaffold.dart';
import 'widget/layout/stack_positioned_layout.dart';
import 'widget/layout/wrap_layout.dart';
import 'widget/other/bottom_navigation_bar.dart';
import 'widget/other/fittedbox.dart';
import 'widget/other/rotatedbox.dart';
import 'widget/other/transform.dart';
import 'widget/view/custom_sliverflexibleheader.dart';
import 'widget/view/sliver_demo.dart';
import 'widget/view/sliverpersistentheader.dart';
import 'widget/view/custom_scrollview.dart';
import 'widget/view/motion_toast.dart';
import 'widget/view/dialog.dart';
import 'widget/view/nestedscrollview.dart';
import 'widget/view/notificationListener.dart';
import 'widget/view/progress.dart';
import 'widget/view/scrollcontroller.dart';
import 'widget/view/singlechildscrollview.dart';
import 'widget/view/slivertoboxadapter.dart';

typedef MenuItemKeyType = int;

void main() => runApp(const LearnFlutterWidgetApp());

class LearnFlutterWidgetApp extends StatefulWidget {
  const LearnFlutterWidgetApp({super.key});
  @override
  LearnFlutterWidgetAppState createState() => LearnFlutterWidgetAppState();
}

class LearnFlutterWidgetAppState extends State<LearnFlutterWidgetApp> {
  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> list=[
    const BoxLayout(),//0
    const RowColumnLayout(), //1
    const FlexLayout(), //2
    const WarpLayout(), //3
    const FlowLayout(), //4
    const StackPositionLayout(), //5
    const AlignLayout(), //6
    const CenterLayout(), //7
    const LayoutBuildLayout(), //8
    const CustomLayout(), //9
    const TextWidget(), //10
    const FontWidget(), //11
    const ButtonWidget(), //12
    const ImageAssetWidget(), //13
    const TextFieldWidget(),//14
    const SwitchWidget(),  //15
    const CheckBoxWidget(),  //16
    const FormWidget(), //17
    const ThemeWidget(), //18
    const ColorsWidget(), //19
    const MotionToastWidget(), //20
    const DropdownButtonWidget(), //21
    const ClipWidget(), //22
    const ProgressWidget(), //23
    const DialogWidget(), //24
    const DecoratedBoxWidget(), //25
    const PaddingEdgeInsetsWidget(), //26
    const ScaffoldWidget(), //27
    const TransformWidget(), //28
    const FittedBoxWidget(), //29
    const RotatedboxWidget(), //30
    const BottomNavigationBarWidget(), //31
    const ContainerWidget(), //32
    const ListViewWidget(), //33
    const AnimatedListWidget(), //34
    const GridViewWidget(), //35
    const PageViewWidget(), //36
    const TabBarViewWidget(), //37
    const SingleChildScrollViewWidget(), //38
    const ScrollControllerWidget(), //39
    const ScrollNotificationWidget(), //40
    const NestedScrollViewWidget(), //41
    const CustomScrollViewWidget(), //42
    const SliverPersistentHeaderWidget(), //43
    const SliverToBoxAdapterWidget(), //44
    const CustomSliverFlexibleHeaderWidget(), //45
    const SliveDemoWidget(),//46
    const WillPopScopeFunc(), //47
    const ValueListenableFunc(), //48
    const FutureBuilderFunc(), //49
    const StreamBuilderFunc(), //50
    const ListenerFunc(),//51
    const GestureDetectorFunc(),//52
    const GestureRecognizerFunc(),//53
    const BothDirectionFunc(),//54
    const GestureConflictFunc(),//55
    EventBusFunc(),//56
    const NotificationListenerFunc(),//57
    const CustomNotificationFunc(),//58
    const AnimationBaseFunc(),//59
    const AnimationStatelistenerFunc(),//60
    const AnimatedWidgetFunc(),//61
    const AnimationRouterFunc(),//62
    const AnimationHeroDemoFunc(),//63
    const AnimationControllerFunc(),//64
    const AnimatedSwitcherFunc(),//65
    const AnimationCustomFUnc(),//66
    const AnimationOhterWidget(),//67
    const CustomGradientButtonWidget(),//68
    const CustomTurnboxWidget(),//69
    const CustomPaintWidget(),//70
    const CustomGradientCircularProgressWidget(),//71
    const CustomCheckboxWidget(), //72
    const CustomDoneWidget(),//73
    const CustomWatermarkWidget(),//74
    const ChannelsFunc(),//75
  ];

  final List<MenuProp> menus=[
    MenuProp(label: "布局（layout）",key: -1,icon: const Icon(Icons.featured_play_list_outlined),
        children: [
          MenuProp(label: "ConstrainedBox", key: 0, icon: const Icon(Icons.gif_box)),
          MenuProp(label: "RowColumn", key: 1, icon: const Icon(Icons.table_rows)),
          MenuProp(label: "FlexExpanded", key: 2, icon: const Icon(Icons.egg)),
          MenuProp(label: "Warp", key: 3, icon: const Icon(Icons.warehouse)),
          MenuProp(label: "Flow", key: 4, icon: const Icon(Icons.flag_outlined)),
          MenuProp(label: "StackPosition", key: 5, icon: const Icon(Icons.stacked_bar_chart)),
          MenuProp(label: "Align", key: 6, icon: const Icon(Icons.format_align_center)),
          MenuProp(label: "Center", key: 7, icon: const Icon(Icons.center_focus_strong)),
          MenuProp(label: "LayoutBuild", key: 8, icon: const Icon(Icons.build)),
          MenuProp(label: "CustomLayout", key: 9, icon: const Icon(Icons.dashboard_customize)),
          MenuProp(label: "Scaffold", key: 27, icon: const Icon(Icons.dashboard_customize)),
          MenuProp(label: "Container", key: 32, icon: const Icon(Icons.dashboard_customize)),
        ]),
    MenuProp(label: "基础（basic）", key: -2, icon: const Icon(Icons.adb),
        children: [
          MenuProp(label: "Text", key: 10, icon: const Icon(Icons.text_format)),
          MenuProp(label: "Font", key: 11, icon: const Icon(Icons.text_format)),
          MenuProp(label: "Button", key: 12, icon: const Icon(Icons.text_format)),
          MenuProp(label: "Image", key: 13, icon: const Icon(Icons.text_format)),
          MenuProp(label: "Theme", key: 18, icon: const Icon(Icons.text_format)),
          MenuProp(label: "Colors", key: 19, icon: const Icon(Icons.text_format)),
          MenuProp(label: "Clip", key: 22, icon: const Icon(Icons.text_format)),
          MenuProp(label: "DecoratedBox", key: 25, icon: const Icon(Icons.text_format)),
          MenuProp(label: "PaddingEdgeInsets", key: 26, icon: const Icon(Icons.text_format)),
          MenuProp(label: "ListView", key: 33, icon: const Icon(Icons.text_format)),
          MenuProp(label: "AnimatedList", key: 34, icon: const Icon(Icons.text_format)),
          MenuProp(label: "GridView", key: 35, icon: const Icon(Icons.text_format)),
          MenuProp(label: "PageView", key: 36, icon: const Icon(Icons.text_format)),
          MenuProp(label: "TabBarView", key: 37, icon: const Icon(Icons.text_format)),
        ]),
    MenuProp(label: "表单", key: -3, icon: const Icon(Icons.table_chart),
        children: [
          MenuProp(label: "TextField", key: 14, icon: const Icon(Icons.text_format)),
          MenuProp(label: "Switch", key: 15, icon: const Icon(Icons.text_format)),
          MenuProp(label: "CheckBox", key: 16, icon: const Icon(Icons.text_format)),
          MenuProp(label: "SelectItem", key: 21, icon: const Icon(Icons.text_format)),
          MenuProp(label: "FormDemo", key: 17, icon: const Icon(Icons.text_format)),
        ]),
    MenuProp(label: "视图", key: -4, icon: const Icon(Icons.back_hand),
        children: [
          MenuProp(label: "Toast", key: 20, icon: const Icon(Icons.text_format)),
          MenuProp(label: "Progress", key: 23, icon: const Icon(Icons.text_format)),
          MenuProp(label: "Dialog", key: 24, icon: const Icon(Icons.text_format)),
          MenuProp(label: "SingleChildScrollView", key: 38, icon: const Icon(Icons.text_format)),
          MenuProp(label: "ScrollController", key: 39, icon: const Icon(Icons.text_format)),
          MenuProp(label: "ScrollNotification", key: 40, icon: const Icon(Icons.text_format)),
          MenuProp(label: "NestedScrollView", key: 41, icon: const Icon(Icons.text_format)),
          MenuProp(label: "CustomScrollView", key: 42, icon: const Icon(Icons.text_format)),
          MenuProp(label: "SliverPersistentHeader", key: 43, icon: const Icon(Icons.text_format)),
          MenuProp(label: "SliverToBoxAdapter", key: 44, icon: const Icon(Icons.text_format)),
          MenuProp(label: "CustomSliverFlexibleHeader", key: 45, icon: const Icon(Icons.text_format)),
          MenuProp(label: "SliveDemo", key: 46, icon: const Icon(Icons.text_format)),
        ]),
    MenuProp(label: "其他", key: -5, icon: const Icon(Icons.back_hand),
        children: [
          MenuProp(label: "Transform", key: 28, icon: const Icon(Icons.text_format)),
          MenuProp(label: "FittedBox", key: 29, icon: const Icon(Icons.text_format)),
          MenuProp(label: "RotatedBox", key: 30, icon: const Icon(Icons.text_format)),
          MenuProp(label: "BottomNavigationBar", key: 31, icon: const Icon(Icons.text_format)),
        ]),
    MenuProp(label: "功能", key: -6, icon: const Icon(Icons.back_hand),
        children: [
          MenuProp(label: "WillPopScope", key: 47, icon: const Icon(Icons.text_format)),
          MenuProp(label: "ValueListenable", key: 48, icon: const Icon(Icons.text_format)),
          MenuProp(label: "FutureBuilder", key: 49, icon: const Icon(Icons.text_format)),
          MenuProp(label: "StreamBuilder", key: 50, icon: const Icon(Icons.text_format)),
          MenuProp(label: "Listener", key: 51, icon: const Icon(Icons.text_format)),
          MenuProp(label: "GestureDetector", key: 52, icon: const Icon(Icons.text_format)),
          MenuProp(label: "GestureRecognizer", key: 53, icon: const Icon(Icons.text_format)),
          MenuProp(label: "BothDirection", key: 54, icon: const Icon(Icons.text_format)),
          MenuProp(label: "GestureConflict", key: 55, icon: const Icon(Icons.text_format)),
          MenuProp(label: "EventBus", key: 56, icon: const Icon(Icons.text_format)),
          MenuProp(label: "NotificationListener", key: 57, icon: const Icon(Icons.text_format)),
          MenuProp(label: "CustomNotification", key: 58, icon: const Icon(Icons.text_format)),
          MenuProp(label: "AnimationBase", key: 59, icon: const Icon(Icons.text_format)),
          MenuProp(label: "AnimationStatelistener", key: 60, icon: const Icon(Icons.text_format)),
          MenuProp(label: "AnimatedWidget", key: 61, icon: const Icon(Icons.text_format)),
          MenuProp(label: "AnimationRouter", key: 62, icon: const Icon(Icons.text_format)),
          MenuProp(label: "AnimationHeroDemo", key: 63, icon: const Icon(Icons.text_format)),
          MenuProp(label: "AnimationController", key: 64, icon: const Icon(Icons.text_format)),
          MenuProp(label: "AnimatedSwitcher", key: 65, icon: const Icon(Icons.text_format)),
          MenuProp(label: "AnimationCustom", key: 66, icon: const Icon(Icons.text_format)),
          MenuProp(label: "AnimationOhterWidget", key: 67, icon: const Icon(Icons.text_format)),
          MenuProp(label: "CustomGradientButtonWidget", key: 68, icon: const Icon(Icons.text_format)),
          MenuProp(label: "CustomTurnboxWidget", key: 69, icon: const Icon(Icons.text_format)),
          MenuProp(label: "CustomPaintWidget", key: 70, icon: const Icon(Icons.text_format)),
          MenuProp(label: "CustomGradientCircularProgressWidget", key: 71, icon: const Icon(Icons.text_format)),
          MenuProp(label: "CustomCheckboxWidget", key: 72, icon: const Icon(Icons.text_format)),
          MenuProp(label: "CustomDoneWidget", key: 73, icon: const Icon(Icons.text_format)),
          MenuProp(label: "CustomWatermarkWidget", key: 74, icon: const Icon(Icons.text_format)),
          MenuProp(label: "Channels", key: 75, icon: const Icon(Icons.text_format)),
        ]),
  ];

  @override
  void initState() {
    super.initState();
  }
  void onSelect(MenuItemKeyType key) {
    debugPrint("$key");
    _pageController.jumpToPage(key);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Menu(
              items: menus,
              collapsed: true,
              onSelect: onSelect,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: list,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Menu extends StatefulWidget {
  final List<MenuProp> items;
  final bool? collapsed;
  final ValueChanged<MenuItemKeyType>? onSelect;

  const Menu({super.key, this.onSelect, this.collapsed, required this.items});
  @override
  State<StatefulWidget> createState() {
    return _MenuState();
  }
}

class _MenuState extends State<Menu> {
  bool _opened = true;
  MenuItemKeyType? selectKey;

  void toggleOpen() {
    setState(() {
      _opened = !_opened;
    });
  }

  void onSelect(MenuItemKeyType selectKey) {
    setState(() {
      this.selectKey = selectKey;
    });
    if (widget.onSelect != null) {
      widget.onSelect!(selectKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MenuWidget(
      menuModel: MenuModel(
          onSelect: onSelect,
          collapsed: widget.collapsed,
          items: widget.items,
          opened: _opened,
          toggleOpen: toggleOpen,
          selectKey: selectKey),
      child: const _MenuLayout(),
    );
  }
}

class _MenuLayout extends StatelessWidget {
  const _MenuLayout();

  Widget _buildMenuItem(MenuProp menuProp, BuildContext context) {
    bool opened = MenuWidget.of(context).menuModel.opened;
    var key = Key("${menuProp.key}");
    if (menuProp.children != null && menuProp.children!.isNotEmpty && !opened) {
      return _PopupSubMenu(key: key, menuProp: menuProp);
    } else if (menuProp.children != null &&
        menuProp.children!.isNotEmpty &&
        opened) {
      return _SubMenu(key: key, menuProp: menuProp);
    }
    return _MenuItem(key: key, menuProp: menuProp);
  }

  @override
  Widget build(BuildContext context) {
    Widget menusChildren;
    bool? collapsed = MenuWidget.of(context).menuModel.collapsed;
    bool opened = MenuWidget.of(context).menuModel.opened;
    VoidCallback toggleOpen = MenuWidget.of(context).menuModel.toggleOpen;
    List<MenuProp> items = MenuWidget.of(context).menuModel.items;

    if (collapsed != null && collapsed) {
      menusChildren = Column(
        children: [
          IconButton(
            onPressed: toggleOpen,
            icon: opened ? const Icon(Icons.menu_open) : const Icon(Icons.menu),
          ),
          const Divider(height: 2),
          Expanded(
            child: ListView(
              children:
              items.map((item) => _buildMenuItem(item, context)).toList(),
            ),
          )
        ],
      );
    } else {
      menusChildren = ListView(
        children: items.map((item) => _buildMenuItem(item, context)).toList(),
      );
    }
    return Drawer(
      width: opened ? 300 : 100,
      child: menusChildren,
    );
  }
}

class _SubMenu extends StatelessWidget {
  const _SubMenu({super.key, required this.menuProp});
  final MenuProp menuProp;

  @override
  Widget build(BuildContext context) {
    List<_MenuItem> children =
    menuProp.children!.map((it) => _MenuItem(menuProp: it)).toList();
    Color primaryColor = Theme.of(context).primaryColor;

    return ExpansionTile(
      title: Text(menuProp.label),
      leading: menuProp.icon,
      iconColor: primaryColor,
      textColor: primaryColor,
      tilePadding: const EdgeInsets.only(left: 0),
      childrenPadding: const EdgeInsets.only(left: 40),
      children: children,
    );
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({super.key, required this.menuProp});
  final MenuProp menuProp;

  @override
  Widget build(BuildContext context) {
    MenuItemKeyType? selectKey = MenuWidget.of(context).menuModel.selectKey;
    ValueChanged<MenuItemKeyType>? onSelect =
        MenuWidget.of(context).menuModel.onSelect;
    bool opened = MenuWidget.of(context).menuModel.opened;
    Color primaryColor = Theme.of(context).primaryColor;
    // Theme.of(context).accentColor
    return ListTile(
      title: opened ? Text(menuProp.label) : menuProp.icon,
      leading: opened ? menuProp.icon : null,
      textColor:
      selectKey != null && selectKey == menuProp.key ? primaryColor : null,
      iconColor:
      selectKey != null && selectKey == menuProp.key ? primaryColor : null,
      contentPadding: const EdgeInsets.only(left: 0),
      onTap: () => {if (onSelect != null) onSelect(menuProp.key)},
    );
  }
}

class _PopupSubMenu extends StatelessWidget {
  const _PopupSubMenu({super.key, required this.menuProp});
  final MenuProp menuProp;

  @override
  Widget build(BuildContext context) {
    ValueChanged<MenuItemKeyType>? onSelect =
        MenuWidget.of(context).menuModel.onSelect;
    MenuItemKeyType? selectKey = MenuWidget.of(context).menuModel.selectKey;
    Color primaryColor = Theme.of(context).primaryColor;
    return PopupMenuButton(
      icon: menuProp.icon,
      tooltip: "展开",
      offset: const Offset(100, 0),
      onSelected: (key) => {if (onSelect != null) onSelect(key)},
      itemBuilder: (BuildContext context) => menuProp.children!
          .map((item) => PopupMenuItem(
        value: item.key,
        child: Text(item.label,
            style: selectKey == item.key
                ? TextStyle(color: primaryColor)
                : null),
      ))
          .toList(),
    );
  }
}

class MenuProp {
  //显示完整标题
  String label;
  MenuItemKeyType key;
  Icon? icon;
  bool? disabled = false;
  //收缩时的短标题
  String? title;
  List<MenuProp>? children;

  MenuProp(
      {required this.label,
        required this.key,
        this.icon,
        this.disabled,
        this.title,
        this.children});
}

class MenuModel {
  final MenuItemKeyType? selectKey;
  final ValueChanged<MenuItemKeyType>? onSelect;
  final bool? collapsed;
  bool opened;
  final List<MenuProp> items;

  VoidCallback toggleOpen;

  MenuModel({
    this.selectKey,
    this.onSelect,
    this.collapsed,
    required this.opened,
    required this.items,
    required this.toggleOpen,
  });
}

class MenuWidget extends InheritedWidget {
  const MenuWidget({
    super.key,
    required this.menuModel,
    required super.child,
  });

  final MenuModel menuModel;

  static MenuWidget? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MenuWidget>();
  }

  static MenuWidget of(BuildContext context) {
    final MenuWidget? result = maybeOf(context);
    assert(result != null, 'No MenuWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MenuWidget oldWidget) {
    bool shouldNotify = menuModel.opened != oldWidget.menuModel.opened ||
        menuModel.selectKey != oldWidget.menuModel.selectKey ||
        menuModel.collapsed != oldWidget.menuModel.collapsed;
    return shouldNotify;
  }
}


//================page

abstract class Data{
  String title="";
  String code="";
  late Widget ui;
  void init();
}
class WidgetPage extends StatelessWidget {
  WidgetPage({super.key,
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