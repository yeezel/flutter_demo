import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//布局约束
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget redBox = const DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );
    //定义一个controller
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ConstrainedBox(
                constraints: const BoxConstraints(
                    minWidth: double.infinity, //宽度尽可能大
                    minHeight: 50.0 //最小高度为50像素
                ),
                child: Container(
                  height: 5.0,
                  child: redBox ,
                ),
              ),
              // SizedBox只是ConstrainedBox的一个定制/
              SizedBox(
                  width: 80.0,
                  height: 80.0,
                  child: redBox
              ),
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(width: 80.0,height: 80.0),
                child: redBox,
              ),
              //有多重限制时，对于minWidth和minHeight来说，是取父子中相应数值较大的
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
                  child: redBox,
                ),
              ),
              // UnconstrainedBox 的子组件将不再受到父组件约束，在"去除"多重限制的时候也许会有帮助
              ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
                  //注意，UnconstrainedBox对父组件限制的“去除”并非是真正的去除：
                  // 虽然红色区域大小是90×20，但上方仍然有80的空白空间。
                  // 也就是说父限制的minHeight(100.0)仍然是生效的，
                  // 只不过它不影响最终子元素redBox的大小，但仍然还是占有相应的空间，
                  // 可以认为此时的父ConstrainedBox是作用于子UnconstrainedBox上，
                  // 而redBox只受子ConstrainedBox限制.
                  // UnconstrainedBox 虽然在其子组件布局时可以取消约束（子组件可以为无限大），
                  // 但是 UnconstrainedBox 自身是受其父组件约束的，所以当 UnconstrainedBox 随着其子组件变大后，
                  // 如果UnconstrainedBox 的大小超过它父组件约束时，也会导致溢出报错
                  child: UnconstrainedBox( //“去除”父级限制
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
                      child: redBox,
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
