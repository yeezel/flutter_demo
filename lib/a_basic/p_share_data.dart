import 'package:flutter/material.dart';

//数据共享
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShareData Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Center(
          child: InheritedWidgetTestRoute(),
        ),
      ),
    );
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  const InheritedWidgetTestRoute({super.key});

  @override
  State<InheritedWidgetTestRoute> createState() => _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: ShareDataWidget( //使用ShareDataWidget
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TestWidget(),//子widget中依赖ShareDataWidget
            ),
            ElevatedButton(
              child: const Text("Increment"),
              //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
              onPressed: () => setState(() => ++count),
            )
          ],
        ),
      ),
    );
  }
}

class ShareDataWidget extends InheritedWidget {
  const ShareDataWidget({
    super.key,
    required this.data,
    required Widget child,
  }) : super(child: child);

  final int data; //需要在子树中共享的数据，保存点击次数

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context, {bool changeDep = true}) {
    if( changeDep==true ) {
      debugPrint("调用dependOnInheritedWidgetOfExactType");
      //
      return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>()!;
    } else {
      debugPrint("调用getElementForInheritedWidgetOfExactType");
      //使用该方法不会触发子widget调用didChangeDependencies方法
      //书上说会触发build方法，测试则没有触发build方法
      return context.getElementForInheritedWidgetOfExactType<ShareDataWidget>()!.widget as ShareDataWidget;
    }
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget重新build
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    debugPrint("${oldWidget.data} != $data");
    return oldWidget.data != data;
  }
}

//子widget
class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    debugPrint("重新build");
    //使用InheritedWidget中的共享数据
    return Text(ShareDataWidget.of(context,changeDep:false).data.toString());
  }

  //当“依赖”发生变化时被Flutter 框架调用该方法。而这个“依赖”指的就是子 widget 是否使用了父 widget 中InheritedWidget的数据
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    //如果需要在依赖改变后执行一些昂贵的操作，比如网络请求，这时最好的方式就是在此方法中执行，这样可以避免每次build()都执行这些昂贵操作。
    debugPrint("Dependencies change");
  }
}