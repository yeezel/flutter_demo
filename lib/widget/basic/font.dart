import 'package:flutter/material.dart';

import '../../framework/page/data.dart';
import '../../framework/page/widget_page.dart';

class FontWidget extends StatelessWidget {
  const FontWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      FontSizeWidget()..init(),
      FontFamilyWidget()..init(),
    ]);
  }
}
class FontSizeWidget extends Data{
  @override
  void init() {
    title="fontSize";
    code = '''
Text(
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
class FontFamilyWidget extends Data{
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