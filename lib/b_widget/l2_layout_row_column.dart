import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//线性布局
//缺点：超出屏幕不会折行
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
          //Row和Column除特殊情况外都只会在主轴方向占用尽可能大的空间，而纵轴的长度则取决于他们最大子元素的长度。
          child: Column(
            //测试Row对齐方式，排除Column默认居中对齐的干扰
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                //表示子组件在Row所占用的水平空间内对齐方式，如果mainAxisSize值为MainAxisSize.min，
                // 则此属性无意义，因为子组件的宽度等于Row的宽度。
                // 只有当mainAxisSize的值为MainAxisSize.max时，此属性才有意义，
                // MainAxisAlignment.start表示沿textDirection的初始方向对齐，
                // 如textDirection取值为TextDirection.ltr时，则MainAxisAlignment.start表示左对齐，
                // textDirection取值为TextDirection.rtl时表示从右对齐。
                // 而MainAxisAlignment.end和MainAxisAlignment.start正好相反；
                // MainAxisAlignment.center表示居中对齐。
                // 可以这么理解：textDirection是mainAxisAlignment的参考系。
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(" hello world "),
                  Text(" I am Jack "),
                ],
              ),
              //由于mainAxisSize值为MainAxisSize.min，Row的宽度等于两个Text的宽度和，所以对齐是无意义的，所以会从左往右显示
              Row(
                //表示Row在主轴(水平)方向占用的空间，默认是MainAxisSize.max，表示尽可能多的占用水平方向的空间，
                // 此时无论子 widgets 实际占用多少水平空间，Row的宽度始终等于水平方向的最大宽度；
                // 而MainAxisSize.min表示尽可能少的占用水平空间，当子组件没有占满水平剩余空间，则Row的实际宽度等于所有子组件占用的的水平空间；
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(" hello world "),
                  Text(" I am Jack "),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                //表示水平方向子组件的布局顺序(是从左往右还是从右往左)，
                //默认为系统当前Locale环境的文本方向(如中文、英语都是从左往右，而阿拉伯语是从右往左)。
                textDirection: TextDirection.rtl,
                children: const <Widget>[
                  Text(" hello world "),
                  Text(" I am Jack "),
                ],
              ),
              Row(
                //表示子组件在纵轴方向的对齐方式，Row的高度等于子组件中最高的子元素高度，
                // 它的取值和MainAxisAlignment一样(包含start、end、 center三个值)，
                // 不同的是crossAxisAlignment的参考系是verticalDirection，
                // 即verticalDirection值为VerticalDirection.down时crossAxisAlignment.start指顶部对齐，
                // verticalDirection值为VerticalDirection.up时，crossAxisAlignment.start指底部对齐；
                // 而crossAxisAlignment.end和crossAxisAlignment.start正好相反；
                crossAxisAlignment: CrossAxisAlignment.start,
                //表示Row纵轴（垂直）的对齐方向，默认是VerticalDirection.down，表示从上到下。
                verticalDirection: VerticalDirection.up,
                children: const <Widget>[
                  Text(
                    " hello world ",
                    style: TextStyle(fontSize: 30.0),
                  ),
                  Text(" I am Jack "),
                ],
              ),
              //特殊情况，Row里面嵌套Row，或者Column里面再嵌套Column，那么只有最外面的Row或Column会占用尽可能大的空间，里面Row或Column所占用的空间为实际大小
              Container(
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(66.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
                    children: <Widget>[
                      Container(
                        color: Colors.red,
                        child: Column(
                          mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
                          children: const <Widget>[
                            Text("hello world "),
                            Text("I am Jack "),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
