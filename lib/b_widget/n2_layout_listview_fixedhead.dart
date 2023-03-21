import 'package:flutter/material.dart';

//固定列表头
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
      home: const Scaffold(
        body: Center(
          child: FixedExtentList(),
        ),
      ),
    );
  }
}
//当我们知道列表项的高度都相同时，强烈建议指定 itemExtent 或 prototypeItem
class FixedExtentList extends StatelessWidget {
  const FixedExtentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const ListTile(title:Text("商品列表")),
      Expanded(
        child: ListView.builder(itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("$index"));
        }),
      ),
    ]);
  }
}