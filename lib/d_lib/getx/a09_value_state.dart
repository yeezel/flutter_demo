import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main(){
  var app = const GetMaterialApp(
    home: Home(),
  );
  runApp(app);
}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(context) {
    return Scaffold(
        appBar: AppBar(title: const Text("config")),
        body: Center(
          child: Column(
            children: [
              //在不使用Obx或GetX的情况下，监听响应式变量的变化，并根据变化更新UI
              ObxValue((data) => Switch(
                  value: data.value, // data是一个响应式变量
                  onChanged: data, // Rx有一个_callable_函数，你可以使用(flag) => data.value = flag
                ),
                false.obs,
              ),
              const Text("Go to Other"),
              //在不使用Obx或GetX的情况下，监听响应式变量的变化，并根据变化更新UI
              ValueBuilder<bool?>(
                initialValue: false,
                builder: (value, updateFn) => Switch(
                  value: value ?? false,
                  onChanged: updateFn, // same signature! you could use ( newValue ) => updateFn( newValue )
                ),
                onUpdate: (value) => debugPrint("Value updated: $value"),
                onDispose: () => debugPrint("Widget unmounted"),
              ),
            ],
          ),
        )
    );
  }
}
