import 'package:flutter/material.dart';

import 'main.dart';

class Demo1 extends Data{
  @override
  void init() {
    title="default";
    code = '''
const Text(
  "这是一个普通字体",
  textAlign: TextAlign.left,
  style: TextStyle(
      fontSize: 80
  ),
)
''';
    ui = const Text(
      "这是一个普通字体",
      textAlign: TextAlign.left,
      style: TextStyle(
          fontSize: 80
      ),
    );
  }
}
class Demo2 extends Data{
  @override
  void init() {
    title="fontFamily";
    code = '''
Text(
  "这是一个得意黑字体",
  style: TextStyle(
    fontFamily: 'SmileySans',
    fontSize: 80
  ),
  textAlign: TextAlign.left,
)
''';
    ui = const Text(
      "这是一个得意黑字体",
      style: TextStyle(
          fontFamily: 'SmileySans',
          fontSize: 80
      ),
      textAlign: TextAlign.left,
    );
  }
}

class FontWidget extends Datas {
  @override
  void init() {
    title = "Font";
    list.add(Demo1()..init());
    list.add(Demo2()..init());
  }
}