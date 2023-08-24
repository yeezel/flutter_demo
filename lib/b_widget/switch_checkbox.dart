import 'package:flutter/material.dart';

import 'main.dart';

class Demo1 extends Data{
  @override
  void init() {
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

    bool _switchSelected=false; //维护单选开关状态
    ui = Switch(
      value: _switchSelected,//当前状态
      onChanged:(value){
        //重新构建页面
        // setState(() { //StatefulWidget
        //   _switchSelected=value;
        // });
      },
    );
  }
}
class Demo2 extends Data{
  @override
  void init() {
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
    bool _checkboxSelected=true;//维护复选框状态
    ui = Checkbox(
      value: _checkboxSelected,
      activeColor: Colors.red, //选中时的颜色
      onChanged:(value){
        // setState(() { //StatefulWidget
          _checkboxSelected=value!;
        // });
      } ,
    );
  }
}

class SwitchCheckBoxWidget extends Datas {
  @override
  void init() {
    title = "Switch_CheckBox";
    list.add(Demo1()..init());
    list.add(Demo2()..init());
  }
}
