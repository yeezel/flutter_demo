import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() => runApp(const GetMaterialApp(home: Home()));
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
              onPressed: () => Get.to(()=>Other(), arguments: {'count': c.count}) //点击跳转到other页面
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

  @override
  Widget build(context){
    // Access the updated count variable
    return Scaffold(
        appBar: AppBar(title: const Text("返回")),
        body: Center(child: Text("${c.count}--param: $count"))
    );
  }
}