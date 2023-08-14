import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main(){
  Get.put(CountController());
  runApp(const GetMaterialApp(home: HomeView()));
}
class CountController extends GetxController{
  var count = 0.obs;
  increment() => count++;
}
class HomeView extends GetView<CountController> {
  const HomeView({super.key});
  @override
  Widget build(context) {

    return Scaffold(
      // 使用obx方法监听状态字段count是否有变化
        appBar: AppBar(title: const Text("getview")),

        body: Center(
            child: Obx(() => Text('Count is ${controller.count}'))
        ),
        floatingActionButton:
        FloatingActionButton(onPressed: controller.increment, child: const Icon(Icons.add)));
  }
}
