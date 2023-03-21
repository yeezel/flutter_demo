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
              //本地加载图片
              const Image(
                image: AssetImage("static/imgs/avatar-default.png"),
                width: 100.0
              ),
              const SizedBox(height: 20,),
              Image.asset("static/imgs/avatar-default.png",
                width: 100.0,
              ),
              const SizedBox(height: 20,),
              //网络加载图片
              const Image(
                image: NetworkImage(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                width: 100.0,
              ),
              const SizedBox(height: 20,),
              Image.network(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                width: 100.0,
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}