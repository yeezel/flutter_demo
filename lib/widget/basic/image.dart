import 'package:flutter/material.dart';

import '../../framework/page/data.dart';
import '../../framework/page/widget_page.dart';

class ImageAssetWidget extends StatelessWidget {
  const ImageAssetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      AssetImageWidget()..init(),
      ImageassetWidget()..init(),
      NetworkImageWidget()..init(),
      ImagenetworkWidget()..init(),
      ImageFitWidget()..init()
    ]);
  }
}

class AssetImageWidget extends Data{
  @override
  void init() {
    title="AssetImage";
    code = '''
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
//本地加载图片
const Image(
  image: AssetImage("static/imgs/avatar-default.png"),
  width: 100.0
)
''';
    ui = const Image(
        image: AssetImage("static/imgs/avatar-default.png"),
        width: 100.0
    );
  }
}
class ImageassetWidget extends Data{
  @override
  void init() {
    title="Image.asset";
    code = '''
//本地加载图片
Image.asset("static/imgs/avatar-default.png",
  width: 100.0,
)
''';
    //文本按钮，默认背景透明并不带阴影
    ui = Image.asset("static/imgs/avatar-default.png",
      width: 100.0,
    );
  }
}

class NetworkImageWidget extends Data{
  @override
  void init() {
    title="NetworkImage";
    code = '''
//网络加载图片
const Image(
  image: NetworkImage(
      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
  width: 100.0,
)
''';
    ui = const Image(
      image: NetworkImage(
          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
      width: 100.0,
    );
  }
}

class ImagenetworkWidget extends Data{
  @override
  void init() {
    title="Image.network";
    code = '''
//网络加载图片
Image.network(
  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
  width: 100.0,
)
''';
    ui = Image.network(
      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
      width: 100.0,
    );
  }
}
class ImageFitWidget extends Data{
  @override
  void init() {
    title="Image fit";
    code = '''
//  fit：该属性用于在图片的显示空间和图片本身大小不同时指定图片的适应模式。适应模式是在BoxFit中定义，它是一个枚举类型，有如下值：
Image(
  image: img,
  height: 50.0,
  width: 100.0,
  fit: BoxFit.fill, //会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形。
  fit: BoxFit.contain,  //这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。
  fit: BoxFit.cover,  //会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁。
  fit: BoxFit.fitWidth, //图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
  fit: BoxFit.fitHeight,  //图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
  fit: BoxFit.scaleDown,
  fit: BoxFit.none,   //图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分。
  colorBlendMode: BlendMode.difference,
  repeat: ImageRepeat.repeatY ,
),
''';
    var img = const AssetImage("static/imgs/avatar.png");
    ui = Center(
        child:
        ListView(
          padding: const EdgeInsets.all(20),
          children: <Image> [
            Image(
              image: img,
              height: 50.0,
              width: 100.0,
              fit: BoxFit.fill,
            ),
            Image(
              image: img,
              height: 50,
              width: 50.0,
              fit: BoxFit.contain,
            ),
            Image(
              image: img,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.cover,
            ),
            Image(
              image: img,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.fitWidth,
            ),
            Image(
              image: img,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.fitHeight,
            ),
            Image(
              image: img,
              width: 100.0,
              height: 50.0,
              fit: BoxFit.scaleDown,
            ),
            Image(
              image: img,
              height: 50.0,
              width: 100.0,
              fit: BoxFit.none,
            ),
            Image(
              image: img,
              width: 100.0,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
              fit: BoxFit.fill,
            ),
            Image(
              image: img,
              width: 100.0,
              height: 200.0,
              repeat: ImageRepeat.repeatY ,
            )
          ].map((e){
            return Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 100,
                    child: e,
                  ),
                ),
                Text(e.fit.toString())
              ],
            );
          }).toList(),
        )
    );
  }
}