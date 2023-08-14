import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(const GetMaterialApp(home: HomePage()));
}
/*
在状态数据中混入页面数据加载状态
RxStatus.loading()：加载中；
RxStatus.success()：加载成功；
RxStatus.error([String? message])：加载失败，可以携带一个错误信息message；
RxStatus.empty()：无数据。
 */
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateMixin Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Press the button to change the state'),
            ElevatedButton(
              onPressed: () {
                Get.to(StatePage());
              },
              child: const Text('Go to State Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class StatePage extends StatelessWidget {
  const StatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StateController>(
      init: StateController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('State Page'),
          ),
          body: controller.obx(
                (state) => Center(
                  child: Text('State is ${state?.value}'),
                ),
                onLoading: const Center(
                  child: CircularProgressIndicator(),
                ),
                onError: (error) => Center(
                  child: Text(error!),
                ),
                onEmpty: const Center(
                  child: Text('No state'),
                ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.changeState();
            },
            child: const Icon(Icons.refresh),
          ),
        );
      },
    );
  }
}

class StateController extends GetxController with StateMixin<RxInt> {
  int counter = 0;

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.empty());
  }

  void changeState() {
    counter++;
    if (counter % 4 == 0) {
      change(null, status: RxStatus.empty());
    } else if (counter % 4 == 1) {
      change(null, status: RxStatus.loading());
    } else if (counter % 4 == 2) {
      change(counter.obs, status: RxStatus.success());
    } else if (counter % 4 == 3) {
      change(null, status: RxStatus.error('Something went wrong'));
    }
  }
}
