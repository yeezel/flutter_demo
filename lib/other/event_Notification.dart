import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//通知（Notification）是Flutter中一个重要的机制，在widget树中，每一个节点都可以分发通知，通知会沿着当前节点向上传递，所有父节点都可以通过NotificationListener来监听通知。
//Flutter中将这种由子向父的传递通知的机制称为通知冒泡（Notification Bubbling）, 向上传递过程中可以终止，终止冒泡后，通知将不会再向上传递
class NotificationListenerFunc extends StatelessWidget {
  const NotificationListenerFunc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child:  NotificationListener(
            //也可只监听特定类型通知base全国
            //NotificationListener<Scro
            // llEndNotification>(
            onNotification: (notification) {
              switch (notification.runtimeType) {
                case ScrollStartNotification:
                  debugPrint("开始滚动");
                  break;
                case ScrollUpdateNotification:
                  debugPrint("正在滚动");
                  break;
                case ScrollEndNotification:
                  debugPrint("滚动停止");
                  break;
                case OverscrollNotification:
                  debugPrint("滚动到边界");
                  break;
              }
              //当返回值为true时，阻止冒泡，其父级Widget将再也收不到该通知；
              // 当返回值为false 时继续向上冒泡通知。
              return false;
            },
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("$index"),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
