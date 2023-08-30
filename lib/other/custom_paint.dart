import 'dart:math';

import 'package:flutter/material.dart';

//绘制五子棋
//性能考虑：1. 重绘rebuild，2. 分层绘制
class CustomPaintWidget extends StatelessWidget {
  const CustomPaintWidget({super.key});

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
          child: CustomPaintRoute(),
        ),
      ),
    );
  }
}

class CustomPaintRoute extends StatelessWidget {
  const CustomPaintRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /*
              painter: 背景画笔，会显示在子节点后面;
              foregroundPainter: 前景画笔，会显示在子节点前面
              size：当child为null时，代表默认绘制区域大小，如果有child则忽略此参数，画布尺寸则为child尺寸。如果有child但是想指定画布为特定大小，可以使用SizeBox包裹CustomPaint实现。
              isComplex：是否复杂的绘制，如果是，Flutter会应用一些缓存策略来减少重复渲染的开销。
              willChange：和isComplex配合使用，当启用缓存时，该属性代表在下一帧中绘制是否会改变。
           */
          RepaintBoundary(
            child: CustomPaint(
              size: const Size(300, 300), //指定画布大小
              painter: MyPainter(),
            ),
          ),
          //添加一个刷新button，回和同一画布的棋盘同时刷新多次，废弃
          //ElevatedButton(onPressed: () {}, child: const Text("刷新"))
          //解决：在新画布创建一个按钮
          //将子节点包裹在RepaintBoundary组件中，这样会在绘制时就会创建一个新的绘制层（Layer），
          // 其子组件将在新的Layer上绘制，而父组件将在原来Layer上绘制，
          // 也就是说RepaintBoundary 子组件的绘制将独立于父组件的绘制，
          // RepaintBoundary会隔离其子节点和CustomPaint本身的绘制边界。
          RepaintBoundary(child: ElevatedButton(onPressed: () {}, child: Text("刷新")))
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  /*
    Canvas：一个画布，包括各种绘制方法，我们列出一下常用的方法：
    API名称 	功能
    drawLine 	画线
    drawPoint 	画点
    drawPath 	画路径
    drawImage 	画图像
    drawRect 	画矩形
    drawCircle 	画圆
    drawOval 	画椭圆
    drawArc 	画圆弧
   */
  @override
  void paint(Canvas canvas, Size size) {
    debugPrint('paint');
    var rect = Offset.zero & size;
    //画棋盘
    drawChessboard(canvas, rect);
    //画棋子
    drawPieces(canvas, rect);
  }

  //在UI树重新build时，控件在绘制前都会先调用该方法以确定是否有必要重绘；
  // 假如我们绘制的UI不依赖外部状态，即外部状态改变不会影响我们的UI外观，那么就应该返回false；
  // 如果绘制依赖外部状态，那么我们就应该在shouldRepaint中判断依赖的状态是否改变，
  // 如果已改变则应返回true来重绘，反之则应返回false不需要重绘
  // 返回false,
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  void drawChessboard(Canvas canvas, Rect rect) {
    //棋盘背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill //填充
      ..color = const Color(0xFFDCC48C);
    canvas.drawRect(rect, paint);

    //画棋盘网格
    paint
      ..style = PaintingStyle.stroke //线
      ..color = Colors.black38
      ..strokeWidth = 1.0;

    //画横线
    for (int i = 0; i <= 15; ++i) {
      double dy = rect.top + rect.height / 15 * i;
      canvas.drawLine(Offset(rect.left, dy), Offset(rect.right, dy), paint);
    }

    for (int i = 0; i <= 15; ++i) {
      double dx = rect.left + rect.width / 15 * i;
      canvas.drawLine(Offset(dx, rect.top), Offset(dx, rect.bottom), paint);
    }
  }
  //画棋子
  void drawPieces(Canvas canvas, Rect rect) {
    double eWidth = rect.width / 15;
    double eHeight = rect.height / 15;
    //画一个黑子
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black;
    //画一个黑子
    canvas.drawCircle(
      Offset(rect.center.dx - eWidth / 2, rect.center.dy - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );
    //画一个白子
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(rect.center.dx + eWidth / 2, rect.center.dy - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );
  }
}