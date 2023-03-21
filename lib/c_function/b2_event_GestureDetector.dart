import 'package:flutter/material.dart';

import '../b_widget/n10_layout_pageview_cache_custom.dart';

//手势
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
        body: Center(
            child: Column(
              children: const [
                SizedBox(height: 50,),
                Text("手势识别"),
                GestureTest(),
                SizedBox(height: 20,),
                Text("拖拽识别"),
                SizedBox(
                  width: 400,
                  height: 200,
                  //在Flutter 的Column或者Row 可动态改变子组件，
                  // 其中子组件大小，位置可能有变化，并且可能溢出就会抛出这个错误 RenderBox was not laid out
                  //解决办法就是 在该组件外嵌套一个SizeBox或者Container并设置width: x, height: x,…
                  child: _Drag(),
                ),
                SizedBox(height: 20,),
                Text("单一方向拖动识别"),
                SizedBox(
                  width: 400,
                  height: 100,
                  //在Flutter 的Column或者Row 可动态改变子组件，
                  // 其中子组件大小，位置可能有变化，并且可能溢出就会抛出这个错误 RenderBox was not laid out
                  //解决办法就是 在该组件外嵌套一个SizeBox或者Container并设置width: x, height: x,…
                  child: _DragVertical(),
                ),
                SizedBox(height: 20,),
                Text("缩放图片"),
                SizedBox(
                  width: 400,
                  height: 200,
                  //在Flutter 的Column或者Row 可动态改变子组件，
                  // 其中子组件大小，位置可能有变化，并且可能溢出就会抛出这个错误 RenderBox was not laid out
                  //解决办法就是 在该组件外嵌套一个SizeBox或者Container并设置width: x, height: x,…
                  child: _Scale(),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
// 手指在一个容器上移动时查看手指相对于容器的位置
class GestureTest extends StatefulWidget {
  const GestureTest({super.key});

  @override
  State<GestureTest> createState() => _GestureTestState();

}

class _GestureTestState extends State<GestureTest> {
  String _operation = "No Gesture detected!"; //保存事件名
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 300.0,
          height: 100.0,
          child: Text(
            _operation,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        //当同时监听onTap和onDoubleTap事件时，当用户触发tap事件时，会有200毫秒左右的延时，
        // 这是因为当用户点击完之后很可能会再次点击以触发双击事件，所以GestureDetector会等一段时间来确定是否为双击事件。
        // 如果用户只监听了onTap（没有监听onDoubleTap）事件时，则没有延时。
        onTap: () => updateText("Tap"), //点击
        onDoubleTap: () => updateText("DoubleTap"), //双击
        onLongPress: () => updateText("LongPress"), //长按
      ),
    );
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}


class _Drag extends StatefulWidget {
  const _Drag();

  @override
  State<_Drag> createState() => _DragState();
}

class _DragState extends State<_Drag> with SingleTickerProviderStateMixin {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0;//距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: const CircleAvatar(child: Text("A")),
            //手指按下时会触发此回调
            onPanDown: (DragDownDetails e) {
              //DragDownDetails.globalPosition：当用户按下时，此属性为用户按下的位置相对于屏幕（而非父组件）原点(左上角)的偏移。
              //打印手指按下的位置(相对于屏幕)
              debugPrint("用户手指按下：${e.globalPosition}");
            },
            //手指滑动时会触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              //DragUpdateDetails.delta：当用户在屏幕上滑动时，会触发多次Update事件，delta指一次Update事件的滑动的偏移量。
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e){
              //DragEndDetails.velocity：该属性代表用户抬起手指时的滑动速度(包含x、y两个轴的），示例中并没有处理手指抬起时的速度，常见的效果是根据用户抬起手指时的速度做一个减速动画
              //打印滑动结束时在x、y轴上的速度
              debugPrint("${e.velocity}");
            },
          ),
        )
      ],
    );
  }
}

class _DragVertical extends StatefulWidget {
  const _DragVertical();
  @override
  State<_DragVertical> createState() => _DragVerticalState();
}

class _DragVerticalState extends State<_DragVertical> {
  double _top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          child: GestureDetector(
            child: const CircleAvatar(child: Text("A")),
            //垂直方向拖动事件
            onVerticalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _top += details.delta.dy;
              });
            },
            //水平方向拖动事件
            // onHorizontalDragUpdate: ,
          ),
        )
      ],
    );
  }
}


class _Scale extends StatefulWidget {
  const _Scale({Key? key}) : super(key: key);

  @override
  _ScaleState createState() => _ScaleState();
}

class _ScaleState extends State<_Scale> {
  double _width = 200.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        //指定宽度，高度自适应
        child: Image.asset("static/imgs/avatar.png", width: _width),
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            //缩放倍数在0.8到10倍之间
            _width=200*details.scale.clamp(.8, 10.0);
          });
        },
      ),
    );
  }
}
