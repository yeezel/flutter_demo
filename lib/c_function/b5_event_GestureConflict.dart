import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//多手势冲突
//当遇到手势冲突时，我们应该优先考虑 Listener
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Center(
            child:  GestureConflictTestRoute(),
        ),
      ),
    );
  }
}

class GestureConflictTestRoute extends StatefulWidget {
  const GestureConflictTestRoute({super.key});
  @override
  State<GestureConflictTestRoute> createState() => GestureConflictTestRouteState();
}

class GestureConflictTestRouteState extends State<GestureConflictTestRoute> {
  double _left = 0.0;
  double _leftB = 0.0;
  double _leftC = 0.0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //使用GestureDetector会出现多手势冲突
        Positioned(
          top: 100,
          left: _left,
          child: GestureDetector(
            child: const CircleAvatar(child: Text("A")), //要拖动和点击的widget
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _left += details.delta.dx;
              });
            },
            onHorizontalDragEnd: (details){
              debugPrint("onHorizontalDragEnd");
            },
            onTapDown: (details){
              debugPrint("down");
            },
            onTapUp: (details){
              debugPrint("up");
            },
          ),
        ),
        //解决方案1：使用Listener监听
        Positioned(
          top: 200.0,
          left: _leftB,
          child: Listener(
            onPointerDown: (details) {
              debugPrint("down");
            },
            onPointerUp: (details) {
              //会触发
              debugPrint("up");
            },
            child: GestureDetector(
              child: const CircleAvatar(child: Text("B")),
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _leftB += details.delta.dx;
                });
              },
              onHorizontalDragEnd: (details) {
                debugPrint("onHorizontalDragEnd");
              },
            ),
          ),
        ),
        Positioned(
          top: 300.0,
          left: _leftC,
          child: Listener(  // 将 GestureDetector 换位 Listener 即可
            onPointerUp: (x) => debugPrint("2"),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.red,
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => debugPrint("1"),
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
