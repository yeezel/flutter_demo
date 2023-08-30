import 'package:flutter/material.dart';

class ListenerFunc extends StatelessWidget {
  const ListenerFunc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
            child: Column(
              children: const [
                SizedBox(height: 20,),
                PointerMoveIndicator(),
                SizedBox(height: 20,),
                _AbsorbPointer(), //忽略指针事件
              ],
            ),
        ),
      ),
    );
  }
}
// 手指在一个容器上移动时查看手指相对于容器的位置
class PointerMoveIndicator extends StatefulWidget {
  const PointerMoveIndicator({super.key});

  @override
  State<StatefulWidget> createState() => _PointerMoveIndicatorState();

}

class _PointerMoveIndicatorState extends State<PointerMoveIndicator> {
  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 300.0,
        height: 150.0,
        child: Text(
          /*
              position：它是指针相对于当对于全局坐标的偏移。
              localPosition: 它是指针相对于当对于本身布局坐标的偏移。
              delta：两次指针移动事件（PointerMoveEvent）的距离。
              pressure：按压力度，如果手机屏幕支持压力传感器(如iPhone的3D Touch)，此属性会更有意义，如果手机不支持，则始终为1。
              orientation：指针移动方向，是一个角度值。
           */
          '${_event?.localPosition ?? ''}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      onPointerDown: (PointerDownEvent event) => setState(() => _event = event),
      onPointerMove: (PointerMoveEvent event) => setState(() => _event = event),
      onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
    );
  }
}

//忽略指针事件
class _AbsorbPointer extends StatefulWidget {
  const _AbsorbPointer({super.key});

  @override
  State<_AbsorbPointer> createState() => _AbsorbPointerState();

}

//忽略指针事件
class _AbsorbPointerState extends State<_AbsorbPointer> {
  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    /*
    IgnorePointer和AbsorbPointer，这两个组件都能阻止子树接收指针事件
    IgnorePointer和AbsorbPointer区别
        AbsorbPointer本身会参与命中测试
        IgnorePointer本身不会参与命中测试
     */
    // return buildAbsorbPointer();
    return buildIgnorePointer();
  }

  Widget buildAbsorbPointer(){
    return Listener(
      child: AbsorbPointer(
        child: Listener(
          child: Container(
            color: Colors.red,
            width: 200.0,
            height: 100.0,
          ),
          onPointerDown: (event)=>debugPrint("Absorb in"),
        ),
      ),
      onPointerDown: (event)=>debugPrint("Absorb up"),
    );
  }

  Widget buildIgnorePointer(){
    return Listener(
      child: IgnorePointer(
        child: Listener(
          child: Container(
            color: Colors.red,
            width: 200.0,
            height: 100.0,
          ),
          onPointerDown: (event)=>debugPrint("Ignore in"),
        ),
      ),
      onPointerDown: (event)=>debugPrint("Ignore up"),
    );
  }
}