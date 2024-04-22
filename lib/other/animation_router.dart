import 'package:flutter/material.dart';

//自定义路由切换动画
//优先使用PageRouteBuilder，特殊情况使用PageRoute
class AnimationRouterFunc extends StatelessWidget {
  const AnimationRouterFunc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("test")),
        body: const Center(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              //渐隐渐入动画，PageRouteBuilder实现
              PageRouteBuilderRoute(),
              SizedBox(height: 20,),
              //渐隐渐入动画，PageRoute实现
              PageRouteRoute(),
            ],
          ),
        ),
      ),
    );
  }
}

class PageRouteRoute extends StatelessWidget {
  const PageRouteRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
      Navigator.push(context, FadeRoute(builder: (context) {
        return const TipRoute(
          // 路由参数
          text: "我是提示xxxx",
        );
      }));
    }, child: const Text("PageRoute实现"));
  }

}
class PageRouteBuilderRoute extends StatelessWidget {
  const PageRouteBuilderRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {
      Navigator.push(
        context,
        //PageRouteBuilder是PageRoute的一个包装
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500), //动画时间为500毫秒
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation secondaryAnimation) {
            return FadeTransition(
              //使用渐隐渐入过渡,
              opacity: animation,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text("新页面"),
                ),
                body: const Text("新页面哟"),
              ),
            );
          },
        ),
      );
    }, child: const Text("PageRouteBuilder实现"));
  }
}

//自定义路由切换动画
class FadeRoute extends PageRoute {
  FadeRoute({
    required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color? barrierColor;

  @override
  final String? barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) => builder(context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );
  }
}
class TipRoute extends StatelessWidget {
  const TipRoute({
    Key? key,
    required this.text,  // 接收一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("提示"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, "我是返回值1"),
                child: const Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}