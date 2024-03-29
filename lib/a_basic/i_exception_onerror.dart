import 'package:flutter/material.dart';
import 'dart:ui';

class MyErrorsHandler {
  static initialize() {}

  static void onErrorDetails(FlutterErrorDetails details) {}

  static void onError(Object error, StackTrace stack) {}
}

Future<void> main() async {
  await MyErrorsHandler.initialize();
  //所有 Flutter 的错误均会被回调方法 FlutterError.onError 捕获
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    MyErrorsHandler.onErrorDetails(details);
  };
  //所有未被 Flutter 处理的错误均会被回调方法PlatformDispatcher.instance.onError捕获
  PlatformDispatcher.instance.onError = (error, stack) {
    MyErrorsHandler.onError(error, stack);
    return true;
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) {
        Widget error = const Text('...rendering error...');
        if (widget is Scaffold || widget is Navigator) {
          error = Scaffold(body: Center(child: error));
        }
        ErrorWidget.builder = (errorDetails) => error;
        if (widget != null) return widget;
        throw ('widget is null');
      },
    );
  }
}