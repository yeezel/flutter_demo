import 'package:flutter/material.dart';

import '../../main.dart';

class RowColumnLayout extends StatelessWidget {
  const RowColumnLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      ColumnWidget()..init(),
      RowMainAxisAlignmentWidget()..init(),
      RowMainAxisSizeWidget()..init(),
      RowTextDirectionWidget()..init(),
      RowCrossAxisAlignmentWidget()..init(),
      NestingWidget()..init(),
    ]);
  }

}

class ColumnWidget extends Data{
  @override
  void init() {
    ui = const Column(
        //测试Row对齐方式，排除Column默认居中对齐的干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("111"),
          Text("222")
        ]
    );
    title="Column";
    code = '''
//线性布局
//缺点：超出屏幕不会折行
//Row和Column除特殊情况外都只会在主轴方向占用尽可能大的空间，而纵轴的长度则取决于他们最大子元素的长度。
const Column(
    //测试Row对齐方式，排除Column默认居中对齐的干扰
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("111"),
      Text("222")
    ]
)
''';
  }
}

class RowMainAxisAlignmentWidget extends Data{
  @override
  void init() {
    ui = const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            //表示子组件在Row所占用的水平空间内对齐方式，
            // 如果mainAxisSize: MainAxisSize.min，此属性不生效，当mainAxisSize：MainAxisSize.max时，此属性才生效，
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(" center "),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(" start "),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(" end "),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(" spaceAround "),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(" spaceBetween "),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(" spaceEvenly "),
            ],
          ),
        ]
    );
    title="Row MainAxisAlignment";
    code = '''
Row(
  //表示子组件在Row所占用的水平空间内对齐方式，
  // 如果mainAxisSize: MainAxisSize.min，此属性不生效，当mainAxisSize：MainAxisSize.max时，此属性才生效，
  mainAxisAlignment: MainAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.end,
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

  children: <Widget>[
    Text(" hello world "),
  ],
)
''';
  }
}

class RowMainAxisSizeWidget extends Data{
  @override
  void init() {
    ui = const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //由于mainAxisSize值为MainAxisSize.min，Row的宽度等于两个Text的宽度和，所以对齐是无意义的，所以会从左往右显示
          Row(
            //表示Row在主轴(水平)方向占用的空间，默认是MainAxisSize.max，表示尽可能多的占用水平方向的空间，
            // 此时无论子 widgets 实际占用多少水平空间，Row的宽度始终等于水平方向的最大宽度；
            // 而MainAxisSize.min表示尽可能少的占用水平空间，当子组件没有占满水平剩余空间，则Row的实际宽度等于所有子组件占用的的水平空间；
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(" min center "),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(" max center "),
            ],
          ),
        ]
    );
    title="row MainAxisSize";
    code = '''
//由于mainAxisSize值为MainAxisSize.min，Row的宽度等于两个Text的宽度和，所以对齐是无意义的，所以会从左往右显示
Row(
  //表示Row在主轴(水平)方向占用的空间，默认是MainAxisSize.max，表示尽可能多的占用水平方向的空间，
  // 此时无论子 widgets 实际占用多少水平空间，Row的宽度始终等于水平方向的最大宽度；
  // 而MainAxisSize.min表示尽可能少的占用水平空间，当子组件没有占满水平剩余空间，则Row的实际宽度等于所有子组件占用的的水平空间；
  mainAxisSize: MainAxisSize.min,
  mainAxisSize: MainAxisSize.max,
  
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text(" I am Jack "),
  ],
),
''';
  }
}

class RowTextDirectionWidget extends Data{
  @override
  void init() {
    ui = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            color: Colors.lime,
            height: 50,
            child:const Row(
              // MainAxisAlignment.start表示沿textDirection的初始方向对齐，
              //    textDirection取值为TextDirection.ltr时表示左对齐，
              //    textDirection取值为TextDirection.rtl时表示从右对齐
              // MainAxisAlignment.end和MainAxisAlignment.start正好相反
              // MainAxisAlignment.center表示居中对齐
              // textDirection是mainAxisAlignment的参考系
              mainAxisAlignment: MainAxisAlignment.start,
              //表示水平方向子组件的布局顺序(是从左往右还是从右往左)，
              //默认为系统当前Locale环境的文本方向(如中文、英语都是从左往右，而阿拉伯语是从右往左)。
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text(" start rtl "),
              ],
            ),
        ),
        Container(
            color: Colors.amber,
            height: 50,
            child:const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Text(" start ltr "),
              ],
            ),
        ),
        Container(
            color: Colors.green,
            height: 50,
            child:const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text(" end rtl "),
              ],
            ),
        ),
        Container(
            color: Colors.yellow,
            height: 50,
            child:const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Text(" end ltr "),
              ],
            ),
        ),
        Container(
            color: Colors.tealAccent,
            height: 50,
            child:const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Text(" center ltr "),
              ],
            )
        ),
      ]
    );
    title="row textDirection";
    code = '''
Row(
    // MainAxisAlignment.start表示沿textDirection的初始方向对齐，
    //    textDirection取值为TextDirection.ltr时表示左对齐，
    //    textDirection取值为TextDirection.rtl时表示从右对齐
    // MainAxisAlignment.end和MainAxisAlignment.start正好相反
    // MainAxisAlignment.center表示居中对齐
    // textDirection是mainAxisAlignment的参考系
    mainAxisAlignment: MainAxisAlignment.start,
    //表示水平方向子组件的布局顺序(是从左往右还是从右往左)，
    //默认为系统当前Locale环境的文本方向(如中文、英语都是从左往右，而阿拉伯语是从右往左)。
    textDirection: TextDirection.rtl,
    children: <Widget>[
      Text(" hello world "),
    ],
  )
''';
  }
}

class RowCrossAxisAlignmentWidget extends Data{
  @override
  void init() {
    ui = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.lime,
            height: 50,
            child: const Row(
              //表示子组件在纵轴方向的对齐方式，Row的高度等于子组件中最高的子元素高度，
              // 它的取值和MainAxisAlignment一样(包含start、end、 center三个值)，
              // crossAxisAlignment的参考系是verticalDirection，
              // verticalDirection值为VerticalDirection.down时，crossAxisAlignment.start指顶部对齐，
              // verticalDirection值为VerticalDirection.up时，crossAxisAlignment.start指底部对齐；
              // 而crossAxisAlignment.end和crossAxisAlignment.start正好相反；
              crossAxisAlignment: CrossAxisAlignment.start,
              //表示Row纵轴（垂直）的对齐方向，默认是VerticalDirection.down，表示从上到下。
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Text(" start up "),
              ],
            ),
          ),
          Container(
            color: Colors.amber,
            height: 50,
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Text(" start down "),
              ],
            ),
          ),
          Container(
            color: Colors.lightBlue,
            height: 50,
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Text(" end up "),
              ],
            ),
          ),
          Container(
              color: Colors.green,
              height: 50,
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Text(" end down "),
                ],
              ),
          ),
          Container(
            color: Colors.red,
            height: 50,
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Text(" center down "),
              ],
            )
          ),
        ]
    );
    title="row CrossAxisAlignment";
    code = '''
Row(
  //表示子组件在纵轴方向的对齐方式，Row的高度等于子组件中最高的子元素高度，
  // 它的取值和MainAxisAlignment一样(包含start、end、 center三个值)，
  // crossAxisAlignment的参考系是verticalDirection，
  // verticalDirection值为VerticalDirection.down时，crossAxisAlignment.start指顶部对齐，
  // verticalDirection值为VerticalDirection.up时，crossAxisAlignment.start指底部对齐；
  // 而crossAxisAlignment.end和crossAxisAlignment.start正好相反；
  crossAxisAlignment: CrossAxisAlignment.start,
  //表示Row纵轴（垂直）的对齐方向，默认是VerticalDirection.down，表示从上到下。
  verticalDirection: VerticalDirection.up,
  children: <Widget>[
    Text(
      " hello world ",
      style: TextStyle(fontSize: 30.0),
    ),
    Text(" I am Jack "),
  ],
)
''';
  }
}

class NestingWidget extends Data{
  @override
  void init() {
    //特殊情况，Row里面嵌套Row，或者Column里面再嵌套Column，那么只有最外面的Row或Column会占用尽可能大的空间，里面Row或Column所占用的空间为实际大小
    ui = Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(66.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
          children: <Widget>[
            Container(
              color: Colors.red,
              child: const Column(
                mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
                children: <Widget>[
                  Text("hello world "),
                  Text("I am Jack "),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    title="nesting";
    code = '''
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
          child: const Column(
            mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
            children: <Widget>[
              Text("hello world "),
              Text("I am Jack "),
            ],
          ),
        ),
      ],
    ),
  ),
)
''';
  }
}