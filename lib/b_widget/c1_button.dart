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
              //"漂浮"按钮，它默认带有阴影和灰色背景
              ElevatedButton(
                child: const Text("normal"),
                onPressed: () => debugPrint("ElevatedButton"),
              ),
              const SizedBox(height: 20,),
              //文本按钮，默认背景透明并不带阴影
              TextButton(
                child: const Text("normal"),
                onPressed: () => debugPrint("TextButton"),
              ),
              const SizedBox(height: 20,),
              //默认有一个边框，不带阴影且背景透明，找不到该类
              OutlinedButton(
                child: const Text("normal"),
                onPressed: () => debugPrint("ElevatedButton"),
              ),
              const SizedBox(height: 20,),
              IconButton(
                icon: const Icon(Icons.thumb_up),
                onPressed: () => debugPrint("IconButton"),
              ),
              const SizedBox(height: 20,),
              ElevatedButton.icon(
                icon: const Icon(Icons.send),
                label: const Text("发送"),
                onPressed: () => debugPrint("ElevatedButton.icon"),
              ),
              const SizedBox(height: 20,),
              OutlinedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("添加"),
                onPressed: () => debugPrint("OutlinedButton.icon"),
              ),
              const SizedBox(height: 20,),
              TextButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("添加"),
                onPressed: () => debugPrint("TextButton.icon"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}