import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../main.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      Demo1()..init(),
      Demo2()..init(),
      Demo3()..init(),
      Demo4()..init(),
      Demo5()..init(),
    ]);
  }
}
//flutter_spinkit 包提供了多种风格的模糊进度指示器
class Demo1 extends Data{
  @override
  void init() {
    title="LinearProgressIndicator";
    code = '''
// 模糊进度条(会执行一个动画)
LinearProgressIndicator(
  backgroundColor: Colors.grey.shade200,
  valueColor: const AlwaysStoppedAnimation(Colors.blue),
)

LinearProgressIndicator(
  backgroundColor: Colors.grey.shade200,
  valueColor: const AlwaysStoppedAnimation(Colors.blue),
  value: .5,
)
''';
    ui = Column(
      children: [
        LinearProgressIndicator(
          backgroundColor: Colors.grey.shade200,
          valueColor: const AlwaysStoppedAnimation(Colors.blue),
        ),
        const SizedBox(
          height: 20,
        ),
        LinearProgressIndicator(
          backgroundColor: Colors.grey.shade200,
          valueColor: const AlwaysStoppedAnimation(Colors.blue),
          value: .5,
        ),
      ],
    );
  }
}
class Demo2 extends Data{
  @override
  void init() {
    title="CircularProgressIndicator";
    code = '''
// 模糊进度条(会执行一个旋转动画)
CircularProgressIndicator(
  backgroundColor: Colors.grey[200],
  valueColor: const AlwaysStoppedAnimation(Colors.blue),
)

//进度条显示50%，会显示一个半圆
CircularProgressIndicator(
  backgroundColor: Colors.grey[200],
  valueColor: const AlwaysStoppedAnimation(Colors.blue),
  value: .5,
)

''';
    ui = Column(
      children: [
        CircularProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: const AlwaysStoppedAnimation(Colors.blue),
        ),
        const SizedBox(
          height: 20,
        ),
        CircularProgressIndicator(
          backgroundColor: Colors.grey[200],
          valueColor: const AlwaysStoppedAnimation(Colors.blue),
          value: .5,
        ),
      ],
    );
  }
}

class Demo3 extends Data{
  @override
  void init() {
    title="Size Progress";
    code = '''
// 线性进度条高度指定为30
SizedBox(
  height: 30,
  child: LinearProgressIndicator(
    backgroundColor: Colors.grey[200],
    valueColor: const AlwaysStoppedAnimation(Colors.blue),
    value: .5,
  ),
)

// 圆形进度条直径指定为200
SizedBox(
  height: 100,
  width: 200,
  child: CircularProgressIndicator(
    backgroundColor: Colors.grey[200],
    valueColor: const AlwaysStoppedAnimation(Colors.blue),
    value: .7,
  ),
)
''';
    ui = Column(
      children: [
        SizedBox(
          height: 30,
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation(Colors.blue),
            value: .5,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        // 圆形进度条直径指定为200
        SizedBox(
          height: 100,
          width: 200,
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation(Colors.blue),
            value: .7,
          ),
        ),
      ],
    );
  }
}

class Demo4 extends Data{
  @override
  void init() {
    title="CircularProgressIndicator";
    code = '''
//进度条在10秒内从灰色变成蓝色的动画
class ProgressRoute extends StatefulWidget {
  const ProgressRoute({super.key});

  @override
  State<ProgressRoute> createState() => _ProgressRouteState();
}

class _ProgressRouteState extends State<ProgressRoute>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    //动画执行时间10秒
    _animationController = AnimationController(
      vsync: this, //注意State类需要混入SingleTickerProviderStateMixin（提供动画帧计时/触发器）
      duration: const Duration(seconds: 10),
    );
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                  .animate(_animationController), // 从灰色变成蓝色
              value: _animationController.value,
            ),
          )
        ],
      ),
    );
  }
}
''';
    ui = const ProgressRoute();
  }
}

class Demo5 extends Data{
  @override
  void init() {
    title="CircularProgressIndicator";
    code = '''
const SpinKitSquareCircle(
  color: Colors.white,
  size: 50.0,
)
''';
    ui = const SpinKitSquareCircle(
      color: Colors.white,
      size: 50.0,
    );
  }
}
class ProgressRoute extends StatefulWidget {
  const ProgressRoute({super.key});

  @override
  State<ProgressRoute> createState() => _ProgressRouteState();
}

class _ProgressRouteState extends State<ProgressRoute>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    //动画执行时间10秒
    _animationController = AnimationController(
      vsync: this, //注意State类需要混入SingleTickerProviderStateMixin（提供动画帧计时/触发器）
      duration: const Duration(seconds: 10),
    );
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                  .animate(_animationController), // 从灰色变成蓝色
              value: _animationController.value,
            ),
          )
        ],
      ),
    );
  }
}