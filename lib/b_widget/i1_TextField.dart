import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({super.key});
  //获取输入内容两种方法
  // 定义两个变量，用于保存用户名和密码，然后在onChange触发时，各自保存一下输入内容。
  // 通过controller直接获取。
  final TextEditingController _unameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
    //定义一个controller
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
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
              ),
              const TextField(
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    prefixIcon: Icon(Icons.lock)
                ),
                obscureText: true, //文本不可见
              ),
              const SizedBox(height: 20,),
              //自定义下划线宽度
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
              ),
              const SizedBox(height: 20,),
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
              ),
              const SizedBox(height: 20,),
              Theme(
                //全局样式， 这种方式labelText不会再高亮显示，而且还无法定义下划线宽度
                  data: Theme.of(context).copyWith(
                      hintColor: Colors.grey[200], //定义下划线颜色
                      inputDecorationTheme: const InputDecorationTheme(
                          labelStyle: TextStyle(color: Colors.red),//定义label字体样式
                          hintStyle: TextStyle(color: Colors.yellow, fontSize: 14.0)//定义提示文本样式
                      )
                  ),
                  child: Column(
                    children: const <Widget>[
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
            ],
          ),
        ),
      ),
    );
  }
}