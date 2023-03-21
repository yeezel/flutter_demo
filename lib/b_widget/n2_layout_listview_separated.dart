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
      home: const Scaffold(
        body: Center(
          //ListView.builder适合列表项比较多或者列表项不确定的情况
          child: ListViewSeparated(),
        ),
      ),
    );
  }
}
class ListViewSeparated extends StatelessWidget {
  const ListViewSeparated({super.key});

  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    const Widget divider1=Divider(color: Colors.blue,);
    const Widget divider2=Divider(color: Colors.green);
    //可以在生成的列表项之间添加一个分割组件，separatorBuilder参数是一个分割组件生成器。
    return ListView.separated(
      itemCount: 100,
      //列表项构造器
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index%2==0?divider1:divider2;
      },
    );
  }
}
