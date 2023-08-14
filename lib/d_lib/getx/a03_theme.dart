import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: const Home()
));
class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(context) {
    return Scaffold(
      // 使用obx方法监听状态字段count是否有变化
        appBar: AppBar(title:  const Text("theme")),
        body: const Center(
            child: Text('hello'),
        ),
        floatingActionButton:
        FloatingActionButton(
            onPressed: (){
              //改变主题
              Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());
            },
            child: const Icon(Icons.change_circle)
        )
    );
  }
}
