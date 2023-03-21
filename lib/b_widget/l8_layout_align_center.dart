import 'package:flutter/material.dart';

//Center继承自Align，当widthFactor或heightFactor为null时组件的宽高将会占用尽可能多的空间
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //定义一个controller
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            children: const <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: Center(
                  child: Text("xxx"),
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: Center(
                  widthFactor: 1,
                  heightFactor: 1,
                  child: Text("xxx"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}