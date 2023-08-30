import 'package:flutter/material.dart';

import '../../main.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      TextFieldControllerWidget()..init(),
      TextFieldObscureWidget()..init(),
      TextFieldEmailWidget()..init(),
      TextFieldInputDecorationWidget()..init(),
      TextFieldLabelWidget()..init(),
      FocusNodeWidget()..init(),
    ]);
  }
}
class TextFieldControllerWidget extends Data{
  //获取输入内容两种方法
  // 定义两个变量，用于保存用户名和密码，然后在onChange触发时，各自保存一下输入内容。
  // 通过controller直接获取。
  final TextEditingController _unameController = TextEditingController();
  @override
  void init() {
    if(_unameController.hasListeners==false){
      //监听输入改变
      _unameController.addListener((){
        debugPrint(_unameController.text);
      });
    }

    _unameController.text = "mycontroller";
    _unameController.selection=TextSelection( //选中功能
        baseOffset: 2,
        extentOffset: _unameController.text.length
    );
    ui = TextField(
      autofocus: true,
      controller: _unameController, //设置controller
      onChanged: (v) {
        debugPrint("onChange: $v");
      },
      decoration: const InputDecoration(
        labelText: "用户名",
        hintText: "用户名或邮箱",
        prefixIcon: Icon(Icons.person),
      ),
    );
    title="controller";
    code = '''
    
if(_unameController.hasListeners==false){
  //监听输入改变
  _unameController.addListener((){
    debugPrint(_unameController.text);
  });
}

_unameController.text = "mycontroller";
_unameController.selection=TextSelection( //选中功能
    baseOffset: 2,
    extentOffset: _unameController.text.length
);

TextField(
  autofocus: true,
  controller: _unameController, //设置controller
  onChanged: (v) {
    debugPrint("onChange: \$v");
  },
  decoration: const InputDecoration(
    labelText: "用户名",
    hintText: "用户名或邮箱",
    prefixIcon: Icon(Icons.person),
  ),
)
''';
  }
}
class TextFieldObscureWidget extends Data{
  @override
  void init() {
    ui = const TextField(
      decoration: InputDecoration(
          labelText: "密码",
          hintText: "您的登录密码",
          prefixIcon: Icon(Icons.lock)
      ),
      obscureText: true, //文本不可见
    );
    title="obscureText";
    code = '''
const TextField(
  decoration: InputDecoration(
      labelText: "密码",
      hintText: "您的登录密码",
      prefixIcon: Icon(Icons.lock)
  ),
  obscureText: true, //文本不可见
)
''';
  }
}

class TextFieldInputDecorationWidget extends Data{
  @override
  void init() {
    title="InputDecoration";
    code = '''
const TextField(
  decoration: InputDecoration(
    labelText: "请输入用户名",
    prefixIcon: Icon(Icons.person),
    // 未获得焦点下划线设为红色
    enabledBorder: UnderlineInputBorder(
      // borderSide: BorderSide(color: Colors.grey),
      borderSide: BorderSide(color: Colors.red),
    ),
    //获得焦点下划线设为绿色
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.green),
    ),
  ),
)
''';
    ui = const TextField(
      decoration: InputDecoration(
        labelText: "请输入用户名",
        prefixIcon: Icon(Icons.person),
        // 未获得焦点下划线设为红色
        enabledBorder: UnderlineInputBorder(
          // borderSide: BorderSide(color: Colors.grey),
          borderSide: BorderSide(color: Colors.red),
        ),
        //获得焦点下划线设为绿色
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}
class TextFieldEmailWidget extends Data{
  @override
  void init() {
    ui = Container(
      decoration: const BoxDecoration(
        // 下滑线浅灰色，宽度1像素
          border: Border(bottom: BorderSide(color: Colors.green, width: 1.0))
      ),
      child: const TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: "Email",
              hintText: "电子邮件地址",
              prefixIcon: Icon(Icons.email),
              border: InputBorder.none //隐藏下划线
          )
      ),
    );
    title="border";
    code = '''
//自定义下划线
Container(
  decoration: const BoxDecoration(
    // 下滑线浅灰色，宽度1像素
      border: Border(bottom: BorderSide(color: Colors.black, width: 1.0))
  ),
  child: const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "电子邮件地址",
          prefixIcon: Icon(Icons.email),
          border: InputBorder.none //隐藏下划线
      )
  ),
)
''';
  }
}

class TextFieldLabelWidget extends Data{
  @override
  void init() {
    ui = Theme(
      //全局样式， 这种方式labelText不会再高亮显示，而且还无法定义下划线宽度
        data: ThemeData.light().copyWith(
            hintColor: Colors.grey[200], //定义下划线颜色
            inputDecorationTheme: const InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.red),//定义label字体样式
                hintStyle: TextStyle(color: Colors.yellow, fontSize: 14.0)//定义提示文本样式
            )
        ),
        child: const Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "密码",
                  hintText: "您的登录密码",
                  //样式就近优先生效
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0)
              ),
              obscureText: true,
            )
          ],
        )
    );
    title="label custom";
    code = '''
Theme(
  //全局样式， 这种方式labelText不会再高亮显示，而且还无法定义下划线宽度
    data: Theme.of(context).copyWith(
        hintColor: Colors.grey[200], //定义下划线颜色
        inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.red),//定义label字体样式
            hintStyle: TextStyle(color: Colors.yellow, fontSize: 14.0)//定义提示文本样式
        )
    ),
    child: const Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.person)
          ),
        ),
        TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: "密码",
              hintText: "您的登录密码",
              //样式就近优先生效
              hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0)
          ),
          obscureText: true,
        )
      ],
    )
)
''';
  }
}

class FocusNodeWidget extends Data{
  @override
  void init() {
    FocusNode focusNode1 = FocusNode();
    FocusNode focusNode2 = FocusNode();
    FocusScopeNode? focusScopeNode;
    // 监听焦点变化
    focusNode1.addListener((){
      //获得焦点时focusNode.hasFocus值为true，失去焦点时为false
      if(focusNode1.hasFocus==false){
        debugPrint("focusNode1 lost");
      } else {
        debugPrint("focusNode1 focus");
      }
    });
    ui = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            focusNode: focusNode1,//关联focusNode1
            decoration: const InputDecoration(
                labelText: "input1"
            ),
          ),
          TextField(
            focusNode: focusNode2,//关联focusNode2
            decoration: const InputDecoration(
                labelText: "input2"
            ),
          ),
          Builder(builder: (ctx) {
            return Column(
              children: <Widget>[
                ElevatedButton(
                  child: const Text("移动焦点"),
                  onPressed: () {
                    //将焦点从第一个TextField移到第二个TextField
                    // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                    // 这是第二种写法
                    focusScopeNode ??= FocusScope.of(ctx);
                    focusScopeNode?.requestFocus(focusNode2);
                  },
                ),
                ElevatedButton(
                  child: const Text("隐藏键盘"),
                  onPressed: () {
                    // 当所有编辑框都失去焦点时键盘就会收起
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  },
                ),
              ],
            );
          },
          ),
        ],
      ),
    );

    title="FocusNode";
    code = '''
FocusNode focusNode1 = FocusNode();
FocusNode focusNode2 = FocusNode();
FocusScopeNode? focusScopeNode;
// 监听焦点变化
focusNode1.addListener((){
  //获得焦点时focusNode.hasFocus值为true，失去焦点时为false
  if(focusNode1.hasFocus==false){
    debugPrint("focusNode1 lost");
  } else {
    debugPrint("focusNode1 focus");
  }
});
Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
    children: <Widget>[
      TextField(
        autofocus: true,
        focusNode: focusNode1,//关联focusNode1
        decoration: const InputDecoration(
            labelText: "input1"
        ),
      ),
      TextField(
        focusNode: focusNode2,//关联focusNode2
        decoration: const InputDecoration(
            labelText: "input2"
        ),
      ),
      Builder(builder: (ctx) {
        return Column(
          children: <Widget>[
            ElevatedButton(
              child: const Text("移动焦点"),
              onPressed: () {
                //将焦点从第一个TextField移到第二个TextField
                // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                // 这是第二种写法
                focusScopeNode ??= FocusScope.of(ctx);
                focusScopeNode?.requestFocus(focusNode2);
              },
            ),
            ElevatedButton(
              child: const Text("隐藏键盘"),
              onPressed: () {
                // 当所有编辑框都失去焦点时键盘就会收起
                focusNode1.unfocus();
                focusNode2.unfocus();
              },
            ),
          ],
        );
      },
      ),
    ],
  ),
);
''';
  }
}