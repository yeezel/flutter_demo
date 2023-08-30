import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


//GestureDetector内部是使用一个或多个GestureRecognizer来识别各种手势的，
// 而GestureRecognizer的作用就是通过Listener来将原始指针事件转换为语义手势， GestureDetector直接可以接收一个子widget。
// GestureRecognizer是一个抽象类，一种手势的识别器对应一个GestureRecognizer的子类，
// Flutter实现了丰富的手势识别器，我们可以直接使用。
//注意：使用GestureRecognizer后一定要调用其dispose()方法来释放资源（主要是取消内部的计时器）。
class GestureRecognizerFunc extends StatelessWidget {
  const GestureRecognizerFunc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Center(
            child: Center(
              child:  _GestureRecognizer(),
            ),
        ),
      ),
    );
  }
}
class _GestureRecognizer extends StatefulWidget {
  const _GestureRecognizer({Key? key}) : super(key: key);

  @override
  State<_GestureRecognizer> createState() => _GestureRecognizerState();
}

class _GestureRecognizerState extends State<_GestureRecognizer> {
  //点击手势
  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            const TextSpan(text: "你好世界"),
            TextSpan(
              text: "点我变色",
              style: TextStyle(
                fontSize: 30.0,
                color: _toggle ? Colors.blue : Colors.red,
              ),
              recognizer: _tapGestureRecognizer
                ..onTap = () {
                  setState(() {
                    _toggle = !_toggle;
                  });
                },
            ),
            const TextSpan(text: "你好世界"),
          ],
        ),
      ),
    );
  }
}