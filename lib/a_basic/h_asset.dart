import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

//读取资源
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<String> loadString(var file, var type, [BuildContext? context]) async {
    if ( type == "rootBundle" ){
      return await rootBundle.loadString(file);
    } else {
      return DefaultAssetBundle.of(context!).loadString(file);
    }
  }

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
              const DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('static/imgs/avatar-default.png'),
                  ),
                ),
              ),
              Image.asset(
                "static/imgs/avatar-default.png",
                width: 80,
              ),
              Text(
                'hello fluter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              ElevatedButton(
                onPressed: () => loadString('static/jsons/user.json','rootBundle').then((value) => debugPrint(value)),
                child: const Text("rootBundle加载文件"),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () => loadString('static/jsons/user.json','DefaultAssetBundle',context).then((value) => debugPrint(value)),
                  child: const Text("DefaultAssetBundle加载文件"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}