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
          //ListView.builder适合列表项比较多或者列表项不确定的情况
          child: ListView.builder(
              //列表项的数量，如果为null，则为无限列表。
              itemCount: 100,
              itemExtent: 50.0, //强制高度为50.0
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text("$index"));
              }
          ),
        ),
      ),
    );
  }
}
