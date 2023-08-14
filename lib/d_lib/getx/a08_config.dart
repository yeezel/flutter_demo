import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main(){
  //两种方式定义全局变量
  //第一种
  Get.config(
    enableLog: true,
    defaultTransition: Transition.fade,
    defaultPopGesture: true,
    defaultOpaqueRoute: true,
    defaultGlobalState: true,
    logWriterCallback: (String text, {bool isError = false})=>{},
    // defaultDurationTransition: Get.defaultDurationTransition,
  );
  //第二种
  var app = const GetMaterialApp(
      home: Home(),
      enableLog: true,
      defaultTransition: Transition.fade,
      opaqueRoute: true,
      popGesture: true,
      defaultGlobalState: true,
      // transitionDuration: Get.defaultDurationTransition,
  );
  runApp(app);
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(title: const Text("config")),
        body: const Center(
            child: Text("Go to Other"),
        )
    );
  }
}
