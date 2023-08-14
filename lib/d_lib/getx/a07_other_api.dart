import 'package:flutter/material.dart';
import 'package:get/get.dart';

// void main() => runApp(GetMaterialApp(
//   initialRoute: '/home',
//   getPages: [
//     GetPage(
//       name: '/home',
//       page: () => const Scaffold(
//           body: Center(
//               child: Text("Go to Other"),
//           ),
//       ),
//     )
//   ],
// ));
/*
  // 获取当前屏幕的参数
  Get.arguments;

// 获取上一个路由名称
  Get.previousRoute

// 获取raw路由
  Get.rawRoute

// give access to Routing API from GetObserver
  Get.routing

// check if snackbar is open
  Get.isSnackbarOpen

// check if dialog is open
  Get.isDialogOpen

// check if bottomsheet is open
  Get.isBottomSheetOpen

// 删除路由
  Get.removeRoute()

// 重复返回， 直到until的predicate返回true为止.
  Get.until()

// 跳转到下一个路由，并移除之前的路由，直到until的predicate返回true为止.
  Get.offUntil()

// 跳转到下一个命名路由，并移除所有之前的路由，直到until的predicate返回true为止.
  Get.offNamedUntil()

//检查所在平台
  GetPlatform.isAndroid
  GetPlatform.isIOS
  GetPlatform.isMacOS
  GetPlatform.isWindows
  GetPlatform.isLinux
  GetPlatform.isFuchsia

//检查设备类型
  GetPlatform.isMobile
  GetPlatform.isDesktop
  GetPlatform.isWeb


// Equivalent to : MediaQuery.of(context).size.height,
// but immutable.
  Get.height
  Get.width

// Gives the current context of the Navigator.
  Get.context

// 在你的代码中任何地方获取snackbar/dialog/bottomsheet的上下文
  Get.contextOverlay


//=======================以下时Context方法

// 桌面或者浏览器窗口缩放的宽高值
  context.width
  context.height

// 赋予您定义一半屏幕、三分之一屏幕等功能。
// 对于响应式应用很有用
// param dividedBy (double) optional - default: 1
// param reducedBy (double) optional - default: 0
  context.heightTransformer()
  context.widthTransformer()

  /// 类似于MediaQuery.of(context).size
  context.mediaQuerySize()

  /// 类似于MediaQuery.of(context).padding
  context.mediaQueryPadding()

  /// 类似于MediaQuery.of(context).viewPadding
  context.mediaQueryViewPadding()

  /// 类似于MediaQuery.of(context).viewInsets;
  context.mediaQueryViewInsets()

  /// 类似于MediaQuery.of(context).orientation;
  context.orientation()

  /// 检查设备是否处于横屏模式
  context.isLandscape()

  /// 检查设备是否处于竖屏模式
  context.isPortrait()

  /// 类似于MediaQuery.of(context).devicePixelRatio
  context.devicePixelRatio()

  /// 类似于MediaQuery.of(context).textScaleFactor
  context.textScaleFactor()

  /// 获取屏幕的最短边
  context.mediaQueryShortestSide()

  /// 如果宽度大于800
  context.showNavbar()

  ///  如果最短边小于600p
  context.isPhone()

  /// 如果最短边大于600p
  context.isSmallTablet()

  /// 如果最短边大于720p，返回true
  context.isLargeTablet()

  /// 如果当前设备是平板，返回true
  context.isTablet()

  /// 根据屏幕大小返回一个值
  /// 可以给出以下值:
  /// watch: 如果最短边小于300
  /// mobile: 如果最短边小于600
  /// tablet: 如果最短边小于1200
  /// desktop: 如果宽度大于1200
  context.responsiveValue<T>()

*/