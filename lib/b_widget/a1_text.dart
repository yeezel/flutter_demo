import 'package:flutter/material.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Hello world",
                textAlign: TextAlign.left,
              ),
              Text(
                "Hello world! I'm Jack. " * 4,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Text(
                "Hello world",
                textScaleFactor: 5.5,
              ),
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
              ),
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
              )),
              DefaultTextStyle(
                //1.设置文本默认样式
                style: const TextStyle(
                  color:Colors.red,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.start,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
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
              ),
              //自定义类继承DefaultTextStyle样式不会生效
              MyStyle(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyStyle extends DefaultTextStyle {
  const MyStyle({
    super.key,
    super.style = const TextStyle(
      color:Colors.red,
      fontSize: 20.0,
      ),
    super.textAlign: TextAlign.start,
    required super.child,
  });
}