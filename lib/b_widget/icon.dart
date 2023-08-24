import 'package:flutter/material.dart';

import 'main.dart';

class Icon1 extends Data{
  @override
  void init() {
    title="unicode";
    code = '''
String icons = "";
// accessible: 0xe03e
icons += "\uE03e";
// error:  0xe237
icons += " \uE237";
// fingerprint: 0xe287
icons += " \uE287";
Text(
  icons,
  style: const TextStyle(
    fontFamily: "MaterialIcons",
    fontSize: 24.0,
    color: Colors.green,
  ),
)
''';
    String icons = "";
    // accessible: 0xe03e
    icons += "\uE03e";
    // error:  0xe237
    icons += " \uE237";
    // fingerprint: 0xe287
    icons += " \uE287";
    ui = Text(
      icons,
      style: const TextStyle(
        fontFamily: "MaterialIcons",
        fontSize: 24.0,
        color: Colors.green,
      ),
    );
  }
}
class Icon2 extends Data{
  @override
  void init() {
    title="Icons";
    code = '''
const Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Icon(Icons.accessible,color: Colors.green),
    Icon(Icons.error,color: Colors.green),
    Icon(Icons.fingerprint,color: Colors.green),
  ],
)
''';
    ui = const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.accessible,color: Colors.green),
        Icon(Icons.error,color: Colors.green),
        Icon(Icons.fingerprint,color: Colors.green),
      ],
    );
  }
}

class Icon3 extends Data{
  @override
  void init() {
    title="custom icon";
    code = '''
//自定义字体图标，现在pubspec.yml文件的font下添加字体图标库
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: const <Widget>[
    Icon(MyIcons.book,color: Colors.purple),
    Icon(MyIcons.wechat,color: Colors.green),
  ],
)
''';
    ui = const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(MyIcons.book,color: Colors.purple),
        Icon(MyIcons.wechat,color: Colors.green),
      ],
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
class IconWidget extends Datas {
  @override
  void init() {
    title = "Icon";
    list.add(Icon1()..init());
    list.add(Icon2()..init());
    list.add(Icon3()..init());
  }
}