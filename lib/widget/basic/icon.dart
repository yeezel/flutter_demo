import 'package:flutter/material.dart';

import '../../main.dart';

class FontLayout extends StatelessWidget {
  const FontLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      UnicodeIconWidget()..init(),
      IconsUtilWidget()..init(),
      CustomIconWidget()..init(),
    ]);
  }
}
class UnicodeIconWidget extends Data{
  @override
  void init() {
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
    title="unicode icon";
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
  }
}
class IconsUtilWidget extends Data{
  @override
  void init() {
    ui = const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.accessible,color: Colors.green),
        Icon(Icons.error,color: Colors.green),
        Icon(Icons.fingerprint,color: Colors.green),
      ],
    );
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
  }
}

class CustomIconWidget extends Data{
  @override
  void init() {
    ui = const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(MyIcons.book,color: Colors.purple),
        Icon(MyIcons.wechat,color: Colors.green),
      ],
    );
    title="custom icon";
    code = '''
//引用
Icon(MyIcons.book,color: Colors.purple),
Icon(MyIcons.wechat,color: Colors.green),    

//自定义字体图标，在pubspec.yml文件的font下添加字体图标库
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
''';
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