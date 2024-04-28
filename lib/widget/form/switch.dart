import 'package:flutter/material.dart';

import '../../framework/page/data.dart';
import '../../framework/page/widget_page.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      SwitchDemo()..init(),
    ]);
  }
}
class SwitchDemo extends Data{
  @override
  void init() {
    bool switchSelected=false; //维护单选开关状态
    ui = Switch(
      value: switchSelected,//当前状态
      onChanged:(value){
        //重新构建页面
        // setState(() { //StatefulWidget
        //   _switchSelected=value;
        // });
      },
    );

    title="Switch";
    code = '''
bool _switchSelected=true; //维护单选开关状态
Switch(
  value: _switchSelected,//当前状态
  onChanged:(value){
    //重新构建页面
    setState(() {
      _switchSelected=value;
    });
  },
)
''';
  }
}