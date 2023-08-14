import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(const GetMaterialApp(home: HomePage()));
}

//GetResponsiveView是一个用于创建响应式布局的组件，它可以让你根据不同的屏幕尺寸和类型，显示不同的UI
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetResponsiveView Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Press the button to change the color'),
            ElevatedButton(
              onPressed: () {
                Get.to(ColorPage());
              },
              child: const Text('Go to Color Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorPage extends GetResponsiveView<ColorController> {
  ColorPage({super.key});

  @override
  Widget builder() {
    Get.put(ColorController()); // 注册控制器
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Page'),
      ),
      body: Center(
        child: Obx(() => Container(
          width: screen.width * 0.5, // 根据screen属性调整宽度
          height: screen.height * 0.5, // 根据screen属性调整高度
          color: controller.color.value, // 根据控制器的颜色变量显示颜色
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.changeColor(); // 调用控制器的方法
        },
        child: const Icon(Icons.colorize),
      ),
    );
  }
}

class ColorController extends GetxController {
  var color = Colors.red.obs; // 响应式变量

  void changeColor() {
    color.value = Colors.primaries[Random().nextInt(Colors.primaries.length)]; // 随机改变颜色
  }
}
