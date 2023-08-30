import 'package:flutter/material.dart';

import '../../main.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      TextAlignWidget()..init(),
      TextMaxLinesWidget()..init(),
      TextScaleFactorWidget()..init(),
      TextStyleWidget()..init(),
      TextSpanWidget()..init(),
      DefaultTextStyleWidget()..init(),
    ]);
  }

}

class TextAlignWidget extends Data{
  @override
  void init() {
    ui =  Column( children: [
      Container(
        width: 200,
        height: 50,
        color: Colors.lightBlue,
        child: const Text(
          "Hello world",
          textAlign: TextAlign.center,
        ),),
      Container(
        width: 200,
        height: 50,
        color: Colors.green,
        child: const Text(
          "Hello world",
          textAlign: TextAlign.left,
        ),
      ),
      Container(
        width: 200,
        height: 50,
        color: Colors.lightBlue,
        child: const Text(
          "Hello world",
          textAlign: TextAlign.right,
        ),
      ),
      Container(
        width: 200,
        height: 50,
        color: Colors.green,
        child: const Text(
          "Hello world",
          textAlign: TextAlign.start,
        ),
      ),
      Container(
        width: 200,
        height: 50,
        color: Colors.lightBlue,
        child: const Text(
          "Hello world",
          textAlign: TextAlign.end,
        ),
      ),
      Container(
        width: 200,
        height: 50,
        color: Colors.green,
        child: const Text(
          "Hello world",
          textAlign: TextAlign.justify,//两端对其
        ),
      ),

    ]);
    title="TextAlign";
    code = '''
Text(
  "Hello world",
  textAlign: TextAlign.center,
  textAlign: TextAlign.left,
  textAlign: TextAlign.right,
  textAlign: TextAlign.start,
  textAlign: TextAlign.end,
  textAlign: TextAlign.justify,//两端对其
)
''';
  }
}

class TextMaxLinesWidget extends Data{
  @override
  void init() {
    ui = Text(
      "maxLine：Hello world! I'm Jack. " * 4,
      maxLines: 1,
      overflow: TextOverflow.ellipsis, //文本溢出窗口后显示省略号
    );
    title="maxLines";
    code = '''
Text(
  "Hello world! I'm Jack. " * 4,
  maxLines: 1,
  overflow: TextOverflow.ellipsis, //文本溢出窗口后显示省略号
)
''';
  }
}

class TextScaleFactorWidget extends Data{
  @override
  void init() {
    ui = const Text(
      "Hello world",
      textScaleFactor: 5.5,
    );
    title="textScaleFactor";
    code = '''
Text(
    "Hello world",
    textScaleFactor: 5.5, //文本比例
  )
''';
  }
}

class TextStyleWidget extends Data{
  @override
  void init() {
    ui = Text("Hello world",
      style: TextStyle(
          color: Colors.blue,
          fontSize: 18.0,
          height: 1.2,
          fontFamily: "Courier",
          background: Paint()..color=Colors.yellow,
          decoration:TextDecoration.underline,
          decorationStyle: TextDecorationStyle.dashed
      ),
    );
    title="TextStyle";
    code = '''
Text("Hello world",
  style: TextStyle(
      color: Colors.blue,
      fontSize: 18.0,
      height: 1.2,
      fontFamily: "Courier",
      background: Paint()..color=Colors.yellow,
      decoration:TextDecoration.underline,
      decorationStyle: TextDecorationStyle.dashed
  ),
)
''';
  }
}

class TextSpanWidget extends Data{
  @override
  void init() {
    //对一个 Text 内容的不同部分按照不同的样式显示
    ui = const Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: "Home: "
            ),
            TextSpan(
              text: "https://flutterchina.club",
              style: TextStyle(
                  color: Colors.blue
              ),
              // recognizer: _tapRecognizer
            ),
          ]
        )
    );
    title="TextSpan";
    code = '''
//对一个 Text 内容的不同部分按照不同的样式显示
Text.rich(
  TextSpan(
    children: [
      TextSpan(
          text: "Home: "
      ),
      TextSpan(
        text: "https://flutterchina.club",
        style: TextStyle(
            color: Colors.blue
        ),
        // recognizer: _tapRecognizer
      ),
    ]
  )
);
''';
  }
}

class DefaultTextStyleWidget extends Data{

  @override
  void init() {
    title="DefaultTextStyle";
    code = '''
const DefaultTextStyle(
  //1.设置文本默认样式
  style: TextStyle(
    color:Colors.red,
    fontSize: 20.0,
  ),
  textAlign: TextAlign.start,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("hello world"),
      Text("I am Jack"),
      Text("I am Jack",
        style: TextStyle(
            inherit: false, //2.不继承默认样式
            color: Colors.grey
        ),
      ),
    ],
  ),
)
''';
    //自定义类继承DefaultTextStyle样式不会生效
    ui = const DefaultTextStyle(
      //1.设置文本默认样式
      style: TextStyle(
        color:Colors.red,
        fontSize: 20.0,
      ),
      textAlign: TextAlign.start,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("hello world"),
          Text("I am Jack"),
          Text("I am Jack",
            style: TextStyle(
                inherit: false, //2.不继承默认样式
                color: Colors.grey
            ),
          ),
        ],
      ),
    );
  }
}