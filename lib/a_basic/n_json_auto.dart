import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_demo/a_basic/n_json_auto_User.dart';

//- 一次性代码生成：`flutter pub run build_runner build --delete-conflicting-outputs`
//- 持续生成代码：`flutter pub run build_runner watch`

//自动序列化
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});
  User? user;
  void _getData() async {
    var file = File('static/jsons/user.json');
    var jsonString = await file.readAsString();
    Map<String, dynamic> userMap = jsonDecode(jsonString);
    user = User.fromJson(userMap);
  }
  @override
  Widget build(BuildContext context) {
    _getData();
    return MaterialApp(
      title: 'json Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('json操作')),
        body: Center(
            child: Text("${user?.name} -- ${user?.address.city}"),
        ),
      ),
    );
  }
}
