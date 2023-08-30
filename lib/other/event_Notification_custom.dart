import 'package:flutter/material.dart';
/*
自定义通知
1. 定义一个通知类，要继承自Notification类；
2. 分发通知。
 */
class CustomNotificationFunc extends StatelessWidget {
  const CustomNotificationFunc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Center(
          child:  NotificationRoute(),
        ),
      ),
    );
  }
}

// 1. 定义一个通知类，要继承自Notification类；
class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}

// 2. 分发通知。
//Notification有一个dispatch(context)方法，它是用于分发通知的，
// 我们说过context实际上就是操作Element的一个接口，它与Element树上的节点是对应的，通知会从context对应的Element节点向上冒泡。
class NotificationRoute extends StatefulWidget {
  const NotificationRoute({super.key});

  @override
  NotificationRouteState createState() {
    return NotificationRouteState();
  }
}

class NotificationRouteState extends State<NotificationRoute> {
  String _msg="";
  @override
  Widget build(BuildContext context) {
    //监听通知
    return NotificationListener<MyNotification>(
      onNotification: (notification){
        debugPrint(notification.msg); //打印通知
        return false;
      },
      child: NotificationListener<MyNotification>(
        onNotification: (notification) {
          setState(() {
            _msg+="${notification.msg}  ";
          });
          //true阻止冒泡，父NotificationListener不会在控制台打印信息
          return true;
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
//           ElevatedButton(
//           onPressed: () => MyNotification("Hi").dispatch(context),
//           child: Text("Send Notification"),
//          ),
              Builder(
                builder: (context) {
                  return ElevatedButton(
                    //按钮点击时分发通知
                    onPressed: () => MyNotification("Hi").dispatch(context),
                    child: const Text("Send Notification"),
                  );
                },
              ),
              Text(_msg)
            ],
          ),
        ),
      ),
    );
  }
}