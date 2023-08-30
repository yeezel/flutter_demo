import 'package:flutter/material.dart';

import '../../main.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      CheckBoxDemo()..init(),
    ]);
  }
}
class CheckBoxDemo extends Data{
  @override
  void init() {
    bool checkboxSelected=true;//维护复选框状态
    ui = Checkbox(
      value: checkboxSelected,
      activeColor: Colors.red, //选中时的颜色
      onChanged:(value){
        // setState(() { //StatefulWidget
        checkboxSelected=value!;
        // });
      } ,
    );

    title="Checkbox";
    code = '''
bool _checkboxSelected=true;//维护复选框状态  
Checkbox(
  value: _checkboxSelected,
  activeColor: Colors.red, //选中时的颜色
  onChanged:(value){
    setState(() {
      _checkboxSelected=value!;
    });
  } ,
)
''';
  }
}