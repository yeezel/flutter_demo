import 'package:flutter/material.dart';

import 'main.dart';


class Text1 extends Data{
  @override
  void init() {
    title="default";
    code = '''
    const Text(
      "Hello world",
      textAlign: TextAlign.left,
    )
    ''';
    ui = const Text(
      "Hello world",
      textAlign: TextAlign.left,
    );
  }
}

class Text2 extends Data{
  @override
  void init() {
    title="maxLines";
    code = '''
Text(
  "Hello world! I'm Jack. " * 4,
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
)
''';
    ui = Text(
      "Hello world! I'm Jack. " * 4,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
class Text3 extends Data{
  @override
  void init() {
    title="textScaleFactor";
    code = '''
Text(
    "Hello world",
    textScaleFactor: 5.5,
  )
''';
    ui = const Text(
      "Hello world",
      textScaleFactor: 5.5,
    );
  }
}
class Text4 extends Data{
  @override
  void init() {
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
  }
}

class Text5 extends Data{
  @override
  void init() {
    title="TextSpan";
    code = '''
//对一个 Text 内容的不同部分按照不同的样式显示
const Text.rich(TextSpan(
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
))
''';
    //对一个 Text 内容的不同部分按照不同的样式显示
    ui = const Text.rich(TextSpan(
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
    ));
  }
}
class Text6 extends Data{

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

class TextWidget extends Datas {
  @override
  void init() {
    title = "Text";
    list.add(Text1()..init());
    list.add(Text2()..init());
    list.add(Text3()..init());
    list.add(Text4()..init());
    list.add(Text6()..init());
  }
}