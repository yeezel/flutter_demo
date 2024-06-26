import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//事件总线通常用于组件之间状态共享
final EventBus bus = EventBus();
class EventBusFunc extends StatelessWidget {
  const EventBusFunc({super.key});
  //定义一个top-level（全局）变量，页面引入该文件后可以直接使用bus
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
            child:  Column(
              children: [
                const SizedBox(height: 50,),
                ElevatedButton(
                    child: const Text("模拟页面A"),
                  onPressed: () async {
                    //监听登录事件
                    bus.on("login", (arg) {
                      // do something
                      debugPrint("register login: $arg");
                    });
                  },
                ),
                ElevatedButton(
                  child: const Text("模拟页面B"),
                  onPressed: () async {
                    //登录成功后触发登录事件，页面A中订阅者会被调用
                    bus.emit("login", "userInfo");
                  },
                ),
              ],
            ),
        ),
      ),
    );
  }
}

//订阅者回调签名
typedef void EventCallback(arg);

class EventBus {
  //私有构造函数
  EventBus._internal();

  //保存单例
  static final EventBus _singleton = EventBus._internal();

  //工厂构造函数
  factory EventBus()=> _singleton;

  //保存事件订阅者队列，key:事件名(id)，value: 对应事件的订阅者队列
  final _emap = Map<Object, List<EventCallback>?>();

  //添加订阅者
  void on(eventName, EventCallback f) {
    _emap[eventName] ??=  <EventCallback>[];
    _emap[eventName]!.add(f);
  }

  //移除订阅者
  void off(eventName, [EventCallback? f]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  //触发事件，事件触发后该事件所有订阅者会被调用
  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) return;
    int len = list.length - 1;
    //反向遍历，防止订阅者在回调中移除自身带来的下标错位
    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }
}