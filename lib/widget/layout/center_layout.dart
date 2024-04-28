import 'package:flutter/material.dart';

import '../../framework/page/data.dart';
import '../../framework/page/widget_page.dart';

class CenterLayout extends StatelessWidget {
  const CenterLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      CenterWidget()..init(),
    ]);
  }

}

class CenterWidget extends Data{
  @override
  void init() {
    ui = const Center(
      child: Column(
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              heightFactor: 5,
              child: Text("xxx"),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.green),
            child: Center(
              widthFactor: 5,
              heightFactor: 3,
              child: Text("xxx"),
            ),
          )
        ],
      ),
    );
    title="center";
    code = '''
//Center继承自Align，当widthFactor或heightFactor为null时组件的宽高将会占用尽可能多的空间
Center(
  child: Column(
    children: <Widget>[
      DecoratedBox(
        decoration: BoxDecoration(color: Colors.red),
        child: Center(
          heightFactor: 5,
          child: Text("xxx"),
        ),
      ),
      DecoratedBox(
        decoration: BoxDecoration(color: Colors.green),
        child: Center(
          widthFactor: 5,
          heightFactor: 3,
          child: Text("xxx"),
        ),
      )
    ],
  ),
)
''';
  }
}