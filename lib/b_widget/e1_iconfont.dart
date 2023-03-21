import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/*
图片参数
const Image({
  ...
  this.width, //图片的宽
  this.height, //图片高度
  this.color, //图片的混合色值
  this.colorBlendMode, //混合模式
  this.fit,//缩放模式
  this.alignment = Alignment.center, //对齐方式
  this.repeat = ImageRepeat.noRepeat, //重复方式
  ...
})
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String icons = "";
    // accessible: 0xe03e
    icons += "\uE03e";
    // error:  0xe237
    icons += " \uE237";
    // fingerprint: 0xe287
    icons += " \uE287";
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
              Text(
                icons,
                style: const TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 24.0,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.accessible,color: Colors.green),
                  Icon(Icons.error,color: Colors.green),
                  Icon(Icons.fingerprint,color: Colors.green),
                ],
              ),
              const SizedBox(height: 20,),
              //自定义字体图标，现在pubspec.yml文件的font下添加字体图标库
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(MyIcons.book,color: Colors.purple),
                  Icon(MyIcons.wechat,color: Colors.green),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyIcons{
  // book 图标
  static const IconData book = IconData(
      0xeea0,
      fontFamily: 'myicon',
      matchTextDirection: true
  );
  // 微信图标
  static const IconData wechat = IconData(
      0xeeb3,
      fontFamily: 'myicon',
      matchTextDirection: true
  );
}