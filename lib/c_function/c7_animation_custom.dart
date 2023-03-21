import 'package:flutter/material.dart';

//自定义过度组件
//1. 继承ImplicitlyAnimatedWidget类。
//2. State类继承自AnimatedWidgetBaseState（该类继承自ImplicitlyAnimatedWidgetState类）。
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
      home: Scaffold(
        appBar: AppBar(title: const Text("test")),
        body: const Center(
          child: CustomTestRoute(),
        ),
      ),
    );
  }
}

class CustomTestRoute extends StatefulWidget {
  const CustomTestRoute({super.key});

  @override
  State<CustomTestRoute> createState() => CustomTestRouteState();
}

class CustomTestRouteState extends State<CustomTestRoute> {
  Color decorationColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    var duration = const Duration(seconds: 5);
    return AnimatedDecoratedBox(
      duration: duration,
      decoration: BoxDecoration(color: decorationColor),
      child: TextButton(
        onPressed: () {
          setState(() {
            decorationColor = Colors.red;
          });
        },
        child: const Text(
          "AnimatedDecoratedBox",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

}

class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
  const AnimatedDecoratedBox({
    Key? key,
    required this.decoration,
    required this.child,
    Curve curve = Curves.linear,
    required Duration duration,
  }) : super(
    key: key,
    curve: curve,
    duration: duration,
  );
  final BoxDecoration decoration;
  final Widget child;

  @override
  AnimatedWidgetBaseState<AnimatedDecoratedBox> createState() {
    return _AnimatedDecoratedBoxState();
  }
}
class _AnimatedDecoratedBoxState
    extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {
  DecorationTween? _decoration;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decoration!.evaluate(animation),
      child: widget.child,
    );
  }

  //该方法用于来更新Tween的初始值的
  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _decoration = visitor(
      _decoration, //当前的tween，第一次调用为null
      widget.decoration,
          (value) => DecorationTween(begin: value),
    ) as DecorationTween;
  }
}


// class AnimatedDecoratedBox1 extends StatefulWidget {
//   const AnimatedDecoratedBox1({
//     Key? key,
//     required this.decoration,
//     required this.child,
//     this.curve = Curves.linear,
//     required this.duration,
//     this.reverseDuration,
//   }) : super(key: key);
//
//   final BoxDecoration decoration;
//   final Widget child;
//   final Duration duration;
//   final Curve curve;
//   final Duration? reverseDuration;
//
//   @override
//   State<AnimatedDecoratedBox1> createState() => _AnimatedDecoratedBox1State();
// }
//
// class _AnimatedDecoratedBox1State extends State<AnimatedDecoratedBox1>
//     with SingleTickerProviderStateMixin {
//   @protected
//   AnimationController get controller => _controller;
//   late AnimationController _controller;
//
//   Animation<double> get animation => _animation;
//   late Animation<double> _animation;
//
//   late DecorationTween _tween;
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _animation,
//       builder: (context, child) {
//         return DecoratedBox(
//           decoration: _tween.animate(_animation).value,
//           child: child,
//         );
//       },
//       child: widget.child,
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: widget.duration,
//       reverseDuration: widget.reverseDuration,
//       vsync: this,
//     );
//     _tween = DecorationTween(begin: widget.decoration);
//     _updateCurve();
//   }
//
//   void _updateCurve() {
//     _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
//   }
//
//   @override
//   void didUpdateWidget(AnimatedDecoratedBox1 oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.curve != oldWidget.curve) _updateCurve();
//     _controller.duration = widget.duration;
//     _controller.reverseDuration = widget.reverseDuration;
//     //正在执行过渡动画
//     if (widget.decoration != (_tween.end ?? _tween.begin)) {
//       _tween
//         ..begin = _tween.evaluate(_animation)
//         ..end = widget.decoration;
//
//       _controller
//         ..value = 0.0
//         ..forward();
//     }
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
