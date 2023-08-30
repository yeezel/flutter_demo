import 'package:flutter/material.dart';

import '../../main.dart';

class ClipWidget extends StatelessWidget {
  const ClipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      AvatarWidget()..init(),
      ClipOvalWidget()..init(),
      ClipRRectWidget()..init(),
      ClipDemoWidget()..init(),
      CustomClipWidget()..init(),
    ]);
  }
}

// 头像
Widget avatar = Image.asset("static/imgs/avatar.png", width: 60.0);

class AvatarWidget extends Data{
  @override
  void init() {
    ui = avatar;
    title="raw";
    code = '''
/*
剪裁Widget 	默认行为
ClipOval 	子组件为正方形时剪裁成内贴圆形；为矩形时，剪裁成内贴椭圆
ClipRRect 	将子组件剪裁为圆角矩形
ClipRect 	默认剪裁掉子组件布局空间之外的绘制内容（溢出部分剪裁）
ClipPath 	按照自定义的路径剪裁
 */
avatar：原始头像
''';
  }
}
class ClipOvalWidget extends Data{
  @override
  void init() {
    title="ClipOval";
    code = '''
/*
ClipOval(child: avatar); //剪裁为圆形
''';
    ui = ElevatedButton(
      child: ClipOval(child: avatar),//剪裁为圆形
      onPressed: () => debugPrint("ElevatedButton"),
    );
  }
}
class ClipRRectWidget extends Data{
  @override
  void init() {
    title="ClipRRect";
    code = '''
/*
ClipRRect(
  //剪裁为圆角矩形
  borderRadius: BorderRadius.circular(5.0),
  child: avatar,
)
''';
    ui = ElevatedButton(
      child: ClipRRect(
        //剪裁为圆角矩形
        borderRadius: BorderRadius.circular(5.0),
        child: avatar,
      ),
      onPressed: () => debugPrint("ElevatedButton"),
    );
  }
}
class ClipDemoWidget extends Data{
  @override
  void init() {
    ui = Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
              child: avatar,
            ),
            const Text(
              "你好世界",
              style: TextStyle(color: Colors.green),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRect(
              //将溢出部分剪裁
              child: Align(
                alignment: Alignment.topLeft,
                widthFactor: .5, //宽度设为原来宽度一半
                child: avatar,
              ),
            ),
            const Text("你好世界", style: TextStyle(color: Colors.green))
          ],
        ),
      ],
    );

    title="custom clip";
    code = '''
/*
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Align(
      alignment: Alignment.topLeft,
      widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
      child: avatar,
    ),
    const Text(
      "你好世界",
      style: TextStyle(color: Colors.green),
    )
  ],
),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    ClipRect(
      //将溢出部分剪裁
      child: Align(
        alignment: Alignment.topLeft,
        widthFactor: .5, //宽度设为原来宽度一半
        child: avatar,
      ),
    ),
    const Text("你好世界", style: TextStyle(color: Colors.green))
  ],
)
''';
  }
}
class CustomClipWidget extends Data{
  @override
  void init() {
    title="custom";
    code = '''
/*
//自定义裁剪
DecoratedBox(
  decoration: const BoxDecoration(
      color: Colors.red
  ),
  child: ClipRect(
      clipper: MyClipper(), //使用自定义的clipper
      child: avatar
  ),
)
class MyClipper extends CustomClipper<Rect> {
  /*
    如果在应用中，剪裁区域始终不会发生变化时应该返回false，这样就不会触发重新剪裁，避免不必要的性能开销。
   */
  @override
  Rect getClip(Size size) => const Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  /*
  接口决定是否重新剪裁。
  如果在应用中，剪裁区域始终不会发生变化时应该返回false，这样就不会触发重新剪裁，避免不必要的性能开销。
  如果剪裁区域会发生变化（比如在对剪裁区域执行一个动画），那么变化后应该返回true来重新执行剪裁。
   */
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
''';
    ui = DecoratedBox(
      decoration: const BoxDecoration(
          color: Colors.red
      ),
      child: ClipRect(
          clipper: MyClipper(), //使用自定义的clipper
          child: avatar
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  /*
    如果在应用中，剪裁区域始终不会发生变化时应该返回false，这样就不会触发重新剪裁，避免不必要的性能开销。
   */
  @override
  Rect getClip(Size size) => const Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  /*
  接口决定是否重新剪裁。
  如果在应用中，剪裁区域始终不会发生变化时应该返回false，这样就不会触发重新剪裁，避免不必要的性能开销。
  如果剪裁区域会发生变化（比如在对剪裁区域执行一个动画），那么变化后应该返回true来重新执行剪裁。
   */
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}
