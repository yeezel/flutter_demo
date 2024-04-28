import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/basic/color.dart';
import 'package:flutter_demo/widget/basic/drawer.dart';
import 'package:flutter_demo/widget/basic/drvider.dart';
import 'package:flutter_demo/widget/basic/image.dart';
import 'package:flutter_demo/widget/layout/box_layout.dart';
import 'package:flutter_demo/widget/layout/custom_layout.dart';
import 'package:flutter_demo/widget/layout/flex_expanded_layout.dart';
import 'package:flutter_demo/widget/layout/flow_layout.dart';
import 'package:flutter_demo/widget/layout/layoutbuild_layout.dart';
import 'package:flutter_demo/widget/layout/row_column_layout.dart';
import 'package:flutter_demo/widget/layout/stack_positioned_layout.dart';
import 'package:flutter_demo/widget/layout/wrap_layout.dart';


import 'framework/index.dart';
import 'framework/nav/menu_data.dart';
import 'other/Rsync_FutureBuilderFunc.dart';
import 'other/Rsync_StreamBuilder.dart';
import 'other/ValueListenableBuilder.dart';
import 'other/animation_AnimatedSwitcher.dart';
import 'other/animation_AnimatedWidget.dart';
import 'other/animation_AnimationControlle.dart';
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
import 'widget/basic/button.dart';
import 'widget/basic/clip.dart';
import 'widget/basic/decoratedbox.dart';
import 'widget/basic/font.dart';
import 'widget/basic/gridview.dart';
import 'widget/basic/listview.dart';
import 'widget/basic/padding_edgeInsets.dart';
import 'widget/basic/pageview.dart';
import 'widget/basic/stepper.dart';
import 'widget/basic/tabbarview.dart';
import 'widget/basic/text.dart';
import 'widget/basic/theme.dart';
import 'widget/form/checkbox.dart';
import 'widget/form/dropdown_button.dart';
import 'widget/form/form.dart';
import 'widget/form/switch.dart';
import 'widget/form/textfield.dart';
import 'widget/layout/align_layout.dart';
import 'widget/layout/center_layout.dart';
import 'widget/layout/container.dart';
import 'widget/layout/scaffold.dart';
import 'widget/other/bottom_navigation_bar.dart';
import 'widget/other/fittedbox.dart';
import 'widget/other/navigationrail.dart';
import 'widget/other/rotatedbox.dart';
import 'widget/other/show.dart';
import 'widget/other/transform.dart';
import 'widget/view/custom_scrollview.dart';
import 'widget/view/custom_sliverflexibleheader.dart';
import 'widget/view/dialog.dart';
import 'widget/view/motion_toast.dart';
import 'widget/view/nestedscrollview.dart';
import 'widget/view/notificationListener.dart';
import 'widget/view/progress.dart';
import 'widget/view/qrcode.dart';
import 'widget/view/scrollcontroller.dart';
import 'widget/view/singlechildscrollview.dart';
import 'widget/view/sliver_demo.dart';
import 'widget/view/sliverpersistentheader.dart';
import 'widget/view/slivertoboxadapter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<MenuData> ms;
  @override
  void initState() {
    ms = menus;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipRect Animation Demo',
      home: DemoNav(
        items: ms,
      ),
    );
  }
}

final List<MenuData> menus=[
  MenuData(title: "布局（layout）",
      children: [
        ...layouts.entries.map((e) => MenuData(title:e.key,page:e.value)).toList(),
      ]),
  MenuData(title: "基础（basic）",
      children: [
        ...basics.entries.map((e) => MenuData(title:e.key,page:e.value)).toList(),
      ]),
  MenuData(title: "表单",
      children: [
        ...form.entries.map((e) => MenuData(title:e.key,page:e.value)).toList(),
      ]),
  MenuData(title: "视图",
      children: [
        ...view.entries.map((e) => MenuData(title:e.key,page:e.value)).toList(),
      ]),
  MenuData(title: "其他",
      children: [
        ...other.entries.map((e) => MenuData(title:e.key,page:e.value)).toList(),
      ]),
  MenuData(title: "功能",
      children: [
        ...func.entries.map((e) => MenuData(title:e.key,page:e.value)).toList(),
      ]),
];

const Map<String, Widget> layouts = {
  "ConstrainedBox":BoxLayout(),
  "RowColumn":RowColumnLayout(),
  "FlexExpanded": FlexLayout(),
  "Warp": WarpLayout(),
  "Flow": FlowLayout(),
  "StackPosition": StackPositionLayout(),
  "Align": AlignLayout(),
  "Center": CenterLayout(),
  "LayoutBuild": LayoutBuildLayout(),
  "CustomLayout": CustomLayout(),
  "Scaffold":ScaffoldWidget(),
  "Container":ContainerWidget(),
};

const Map<String, Widget> basics = {
  "文本（Text）":TextWidget(),
  "字体（Font）":FontWidget(),
  "按钮（Button）":ButtonWidget(),
  "图片（Image）":ImageAssetWidget(),
  "主题（Theme）":ThemeWidget(),
  "颜色（Colors）":ColorsWidget(),
  "裁剪（Clip）":ClipWidget(),
  "侧边栏/抽屉（Drawer）":DrawerWidget(),
  "下划线（Drivider）":DrividerWidget(),
  "DecoratedBox":DecoratedBoxWidget(),
  "PaddingEdgeInsets": PaddingEdgeInsetsWidget(),
  "列表（ListView）":ListViewWidget(),
  "动画列表（AnimatedList）":AnimatedListWidget(),
  "GridView":GridViewWidget(),
  "PageView":PageViewWidget(),
  "TabBarView":TabBarViewWidget(),
  "步骤（Stepper）":StepperWidget(),
};

const Map<String, Widget> form = {
  "字段（TextField）":TextFieldWidget(),
  "切换按钮（Switch）":SwitchWidget(),
  "勾选框（CheckBox）":CheckBoxWidget(),
  "下拉框（SelectItem）":DropdownButtonWidget(),
  "表单（FormDemo）":FormWidget(),
};

const Map<String, Widget> view = {
  "提示框（Toast）":MotionToastWidget(),
  "进度条（Progress）":ProgressWidget(),
  "弹窗（Dialog）":DialogWidget(),
  "SingleChildScrollView":SingleChildScrollViewWidget(),
  "ScrollController":ScrollControllerWidget(),
  "ScrollNotification":ScrollNotificationWidget(),
  "NestedScrollView":NestedScrollViewWidget(),
  "CustomScrollView":CustomScrollViewWidget(),
  "SliverPersistentHeader":SliverPersistentHeaderWidget(),
  "SliverToBoxAdapter":SliverToBoxAdapterWidget(),
  "CustomSliverFlexibleHeader":CustomSliverFlexibleHeaderWidget(),
  "SliveDemo":SliveDemoWidget(),
  "二维码（QrCode）":QrCodeWidget(),
};

const Map<String, Widget> other = {
  "Transform":TransformWidget(),
  "FittedBox":FittedBoxWidget(),
  "RotatedBox":RotatedboxWidget(),
  "BottomNavigationBar":BottomNavigationBarWidget(),
  "NavigationRail":NavigationRailWidget(),
  "ShowWidget":ShowWidget(),
};

const Map<String, Widget> func = {
  "WillPopScope":WillPopScopeFunc(),
  "ValueListenable":ValueListenableFunc(),
  "FutureBuilder":FutureBuilderFunc(),
  "StreamBuilder":StreamBuilderFunc(),
  "Listener":ListenerFunc(),
  "GestureDetector":GestureDetectorFunc(),
  "GestureRecognizer":GestureRecognizerFunc(),
  "BothDirection":BothDirectionFunc(),
  "GestureConflict":GestureConflictFunc(),
  "EventBus":EventBusFunc(),
  "NotificationListener":NotificationListenerFunc(),
  "CustomNotification":CustomNotificationFunc(),
  "AnimationBase":AnimationStatelistenerFunc(),
  "AnimatedWidget":AnimatedWidgetFunc(),
  "AnimationRouter":AnimationRouterFunc(),
  "AnimationHeroDemo":AnimationHeroDemoFunc(),
  "AnimationController":AnimationControllerFunc(),
  "AnimatedSwitcher":AnimatedSwitcherFunc(),
  "AnimationCustom":AnimationCustomFUnc(),
  "AnimationOhterWidget":AnimationOhterWidget(),
  "CustomGradientButtonWidget":CustomGradientButtonWidget(),
  "CustomTurnboxWidget":CustomTurnboxWidget(),
  "CustomPaintWidget":CustomPaintWidget(),
  "CustomGradientCircularProgressWidget":CustomGradientCircularProgressWidget(),
  "CustomCheckboxWidget":CustomCheckboxWidget(),
  "CustomDoneWidget":CustomDoneWidget(),
  "CustomWatermarkWidget":CustomWatermarkWidget(),
  "Channels":ChannelsFunc(),
};