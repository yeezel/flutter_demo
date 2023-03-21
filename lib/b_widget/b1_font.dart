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
            children: const <Widget>[
              Text(
                "这是一个普通字体",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 80
                ),
              ),
              SizedBox(),
              Text(
                "这是一个得意黑字体",
                style: TextStyle(
                  fontFamily: 'SmileySans',
                  fontSize: 80
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}