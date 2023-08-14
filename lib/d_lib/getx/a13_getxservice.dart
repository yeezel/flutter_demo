import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DbService extends GetxService {
  Future<DbService> init() async {
    debugPrint('$runtimeType delays 2 sec');
    await 2.delay();
    debugPrint('$runtimeType ready!');
    return this;
  }
}

class SettingsService extends GetxService {
  Future<SettingsService> init() async {
    debugPrint('$runtimeType delays 1 sec');
    await 1.delay();
    debugPrint('$runtimeType ready!');
    return this;
  }
}
void initServices() async {
  debugPrint('starting services ...');
  await Get.putAsync(() => DbService().init());
  await Get.putAsync(() => SettingsService().init());
  debugPrint('All services started...');
}
void main(){
  //创建一个不受生命周期影响的服务类，它不会被销毁，也不会占用内存
  //作用是提供一些全局的、持久的、不需要UI更新的功能，例如网络请求、数据库操作、本地存储等
  //应用场景是在runApp之前，用于启动App之前进行初始化工作，例如初始化网络配置、数据库配置、本地化配置等
  initServices();
  runApp(const GetMaterialApp(home: HomePage()));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetxService Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Press the button to get the current time'),
            ElevatedButton(
              onPressed: () {
                Get.to(const TimePage());
              },
              child: const Text('Go to Time Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class TimePage extends GetView<TimeController> {
  const TimePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TimeController()); // 注册控制器
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Page'),
      ),
      body: Center(
        child: Obx(() => Text('Current time is ${controller.time}')), // 直接通过controller属性访问控制器
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getTime(); // 调用控制器的方法
        },
        child: const Icon(Icons.timer),
      ),
    );
  }
}

class TimeController extends GetxController {
  var time = ''.obs; // 响应式变量

  void getTime() async {
    time.value = await DateTimeService().getCurrentTime(); // 调用DateTimeService的方法获取当前时间
  }
}


class DateTimeService extends GetxService {
  Future<String> getCurrentTime() async {
    var response = await GetHttpClient().get('http://worldtimeapi.org/api/timezone/Asia/Shanghai'); // 发送网络请求获取时间数据
    if (response.status.hasError) {
      return 'Error';
    } else {
      var data = response.body;
      return data['datetime']; // 返回时间字符串
    }
  }
}
