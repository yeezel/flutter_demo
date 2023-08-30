import 'package:flutter/material.dart';

//用AnimatedWidget 可以从动画中分离出 widget
//用AnimatedBuilder 将渲染逻辑分离出来
//好处：不用显式添加监听，提高性能，封装复用

class AnimatedWidgetFunc extends StatelessWidget {
  const AnimatedWidgetFunc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Center(
          child:  ScaleAnimationRoute(),
        ),
      ),
    );
  }
}

//AnimatedBuilder正是将渲染逻辑分离出来
class GrowTransition extends StatelessWidget {
  const GrowTransition({Key? key,
    required this.animation,
    this.child,
  }) : super(key: key);

  final Widget? child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      //AnimatedBuilder正是将渲染逻辑分离出来,好处有三
      //1. 不用显式的去添加帧监听器，然后再调用setState() 了，这个好处和AnimatedWidget是一样的
      //2. 更好的性能：因为动画每一帧需要构建的 widget 的范围缩小了，如果没有builder，setState()将会在父组件上下文中调用，这将会导致父组件的build方法重新调用；而有了builder之后，只会导致动画widget自身的build重新调用，避免不必要的rebuild。
      //3. 通过AnimatedBuilder可以封装常见的过渡效果来复用动画。
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}


//用AnimatedWidget 可以从动画中分离出 widget
class AnimatedImage extends AnimatedWidget {

  const AnimatedImage({
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return GrowTransition(
      animation: animation,
      child: Image.asset("static/imgs/avatar.png"),
    );
  }
}

class ScaleAnimationRoute extends StatefulWidget {
  const ScaleAnimationRoute({Key? key}) : super(key: key);

  @override
  State<ScaleAnimationRoute> createState() => _ScaleAnimationRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    //匀速
    //图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 500.0).animate(controller);

    //启动动画(正向执行)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedImage(
      animation: animation,
    );
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
