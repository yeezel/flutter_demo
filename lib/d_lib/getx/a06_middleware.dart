import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() => runApp(GetMaterialApp(
  initialRoute: '/home',
  getPages: [
    GetPage(
      name: '/home',
      page: () => const Home(),
    ),
    GetPage(
      name: '/detail',
      page: () => Other(),
      //当GetPage有一个中间件时，该页面的所有子级将自动拥有相同的中间件
      middlewares: [  //在进入other页面时，会执行以下中间件进行检查
        // priority : 设置优先级，数字越小，优先级越高，以下运行顺序为： -8 => 2 => 4 => 5
        AuthMiddleware(priority: 2)
        // GetMiddleware(priority: 5),
        // GetMiddleware(priority: 4),
        // GetMiddleware(priority: -8),
      ]
      // 指定绑定类，使用DetailBinding来注入DetailController
      // binding: DetailBinding(),
      // 指定转场动画为淡入淡出
      // transition: Transition.fade,
    )
  ],
));

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(context) {

    return Scaffold(
      // 使用obx方法监听状态字段count是否有变化
        appBar: AppBar(title: Obx(() => const Text("middle"))),

        body: Center(
            child: ElevatedButton(
                child: const Text("Go to Other"),
                onPressed: () => Get.toNamed("/detail")
            )
        ),
        floatingActionButton:
        FloatingActionButton(onPressed: (){}, child: const Icon(Icons.add)));
  }
}

//页面定义
class Other extends StatelessWidget {
  //可在任何地方获取组件
  Other({super.key});

  @override
  Widget build(context){
    debugPrint("other build");
    // Access the updated count variable
    return Scaffold(
        appBar: AppBar(title: const Text("返回")),
        body: Center(child: Column(children: [
          const Text("detail"),
          ElevatedButton(
              child: const Text("Go to Other"),
              onPressed: () => Get.back()
          )
        ],))
    );
  }
}

// 定义一个中间件类，用来验证用户是否登录
//调用顺序：onPageCalled->redirect->onBindingsStart->onPageBuildStart->onPageBuilt->onPageDispose
class AuthMiddleware extends GetMiddleware {
  AuthMiddleware({super.priority});
  // 跳转页面时被调用
  // 重写redirect方法，返回一个RouteSettings对象，表示要跳转到的页面或者路由
  @override
  RouteSettings? redirect(String? route) {
    debugPrint("页面跳转时调用：redirect");
    //final authService = Get.find<AuthService>();
    var isLogin = true;
    // 检查用户是否登录
    return isLogin ? null : const RouteSettings(name: '/home');
  }

  //
  @override
  GetPage? onPageCalled(GetPage? page) {
    // final authService = Get.find<AuthService>();
    // return page.copyWith(title: 'Welcome ${authService.UserName}');
    debugPrint("页面跳转前调用：onPageCalled");
    return super.onPageCalled(page);
  }

  // 初始化之前被调用
  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    debugPrint("进入页面后，在Bindings初始化之前调用：onBindingsStart");
    // final authService = Get.find<AuthService>();
    // if (authService.isAdmin) {
    //   bindings.add(AdminBinding());
    // }
    return bindings;
  }

  // 初始化之后被调用
  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    debugPrint('进入页面后，在Bindings初始化之后调用：onPageBuildStart');
    return page;
  }

  //在调用GetPage.page函数后立即调用
  @override
  Widget onPageBuilt(Widget page) {
    debugPrint('调用GetPage.page函数后调用：onPageBuilt');
    return super.onPageBuilt(page);
  }


  //退出页面的时候调用
  @override
  void onPageDispose() {
    debugPrint('退出页面的时候调用：onPageDispose');
    super.onPageDispose();
  }
}