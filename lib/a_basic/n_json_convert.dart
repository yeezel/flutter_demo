import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

//手动序列化
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});

  Map<String, dynamic>? user;
  void _getData() async {
    var file = File('static/jsons/user.json');
    var jsonString = await file.readAsString();
    user = jsonDecode(jsonString);
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
            child: Text(user!["email"]),
        ),
      ),
    );
  }
}
