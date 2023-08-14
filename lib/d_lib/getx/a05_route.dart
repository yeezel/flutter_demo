import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() => runApp(GetMaterialApp(
    initialRoute: '/home',
    getPages: [
      // 定义一个GetPage对象，表示主页
      GetPage(
        name: '/home',
        page: () => const Home(),
      ),
      // 定义一个GetPage对象，表示详情页
      GetPage(
        name: '/detail',
        page: () => Other(),
        // 指定绑定类，使用DetailBinding来注入DetailController
        // binding: DetailBinding(),
        // 指定转场动画为淡入淡出
        // transition: Transition.fade,
      )
    ],
));
class Controller extends GetxController{
  var count = 0.obs;
  increment() => count++;
}
class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(context) {

    // 添加组件
    final Controller c = Get.put(Controller());

    return Scaffold(
      // 使用obx方法监听状态字段count是否有变化
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

        body: Center(
            child: ElevatedButton(
                child: const Text("Go to Other"),
                /*
                  // 跳转到DetailPage，并传入一个id参数
                  Get.to(DetailPage(), arguments: {'id': 1});

                  // 跳转到DetailPage，并设置转场动画为淡入淡出
                  Get.to(DetailPage(), transition: Transition.fade);

                  // 跳转到DetailPage，并使用命名路由
                  Get.to(GetPage(name: '/detail', page: () => DetailPage()));

                  // 跳转到LoginPage，并移除当前页面
                  Get.off(LoginPage());

                  // 跳转到HomePage，并清空栈
                  Get.offAll(HomePage());

                  // 跳转到命名路由为'/login'的页面，并移除当前页面
                  Get.offNamed('/login');

                  // 跳转到命名路由为'/home'的页面，并清空栈
                  Get.offAllNamed('/home');
                 */
                onPressed: () => Get.toNamed("/detail",parameters: {"count": "${c.count}"}, arguments: {'count': "${c.count}"}) //点击跳转到other页面
            )
        ),
        floatingActionButton:
        FloatingActionButton(onPressed: c.increment, child: const Icon(Icons.add)));
  }
}

//页面定义
class Other extends StatelessWidget {
  //可在任何地方获取组件
  final Controller c = Get.find();
  final String? count = Get.parameters['count'];
  final String? count1 = Get.arguments['count'];

  Other({super.key});

  @override
  Widget build(context){
    // Access the updated count variable
    return Scaffold(
        appBar: AppBar(title: const Text("返回")),
        body: Center(child: Column(children: [
          Text("${c.count}--param: $count--args: $count1"),
            ElevatedButton(
              child: const Text("Go to Other"),
              // 返回上一个页面，并返回一个result参数
              // Get.back(result: {'result': 'success'});
              onPressed: () => Get.back() //返回上一个页面
            )
        ],))
    );
  }
}