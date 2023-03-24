import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:process_run/shell.dart';

Future main() async {
  // This works on Windows/Linux/Mac

  var shell = Shell();

  await shell.run('''

# Display some text
echo Hello

# Display dart version
dart --version

# Display pub version
flutter --version

  ''');

  await Future.delayed(const Duration(seconds: 2));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var shell = Shell();
    Future<List<ProcessResult>>? runShell;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    // Changing directory
                    shell = shell.pushd("D:\\v2ray");
                    shell.run("v2ray").then((value) {
                      for (var res in value) {
                        debugPrint("${res.outLines}");
                      }
                    });
                  },
                  child: const Text("启动程序")),
              ElevatedButton(
                  onPressed: () {
                    try{
                      var res = shell.kill(ProcessSignal.sigkill);
                      debugPrint("kill $res");
                    } on ShellException catch (e) {
                      debugPrint("err: $e");
                    }
                    // if(res) shell = shell.popd();
                  },
                  child: const Text("关闭程序")),
              ElevatedButton(
                  onPressed: () {
                    shell.kill();
                    shell = shell.pushd("D:\\v2ray");
                    shell.run("v2ray").then((value) {
                      for (var res in value) {
                        debugPrint("${res.outLines}");
                      }
                    });
                    shell = shell.popd();
                  },
                  child: const Text("重启程序"))
            ],
          ),
        )),
      ),
    );
  }
}
