import 'package:flutter/material.dart';

import 'main.dart';

class Demo1 extends Data{
  @override
  void init() {
    title="Form";
    code = '''
final TextEditingController _unameController = TextEditingController();
final TextEditingController _pwdController = TextEditingController();
final GlobalKey _formKey = GlobalKey<FormState>();
Form(
  key: _formKey, //设置globalKey，用于后面获取FormState
  autovalidateMode: AutovalidateMode.onUserInteraction,
  child: Column(
    children: <Widget>[
      TextFormField(
        autofocus: true,
        controller: _unameController,
        decoration: const InputDecoration(
          labelText: "用户名",
          hintText: "用户名或邮箱",
          icon: Icon(Icons.person),
        ),
        // 校验用户名
        validator: (v) {
          return v!.trim().isNotEmpty ? null : "用户名不能为空";
        },
      ),
      TextFormField(
        controller: _pwdController,
        decoration: const InputDecoration(
          labelText: "密码",
          hintText: "您的登录密码",
          icon: Icon(Icons.lock),
        ),
        obscureText: true,
        //校验密码
        validator: (v) {
          return v!.trim().length > 5 ? null : "密码不能少于6位";
        },
      ),
      // 登录按钮
      Padding(
        padding: const EdgeInsets.only(top: 28.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("登录"),
                ),
                onPressed: () {
                  // FormState.validate()：调用此方法后，会调用Form子孙FormField的validate回调，如果有一个校验失败，则返回false，所有校验失败项都会返回用户返回的错误提示。
                  // FormState.save()：调用此方法后，会调用Form子孙FormField的save回调，用于保存表单内容
                  // FormState.reset()：调用此方法后，会将子孙FormField的内容清空
                  // 通过_formKey.currentState 获取FormState后，
                  // 调用validate()方法校验用户名密码是否合法，校验
                  // 通过后再提交数据。
                  if ((_formKey.currentState as FormState).validate()) {
                    //验证通过提交数据
                  }
                },
              ),
            ),
            Expanded(
              //登录按钮的onPressed方法中不能通过Form.of(context)来获取FormState，
              //原因是，此处的context为FormTestRoute的context，而Form.of(context)是根据所指定context向根去查找，而FormState是在FormTestRoute的子树中，所以不行。
              //正确的做法是通过Builder来构建登录按钮，Builder会将widget节点的context作为回调参数
              // 通过Builder来获取ElevatedButton所在widget树的真正context(Element)
                child:Builder(builder: (context){
                  return ElevatedButton(
                    onPressed: () {
                      //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                      if(Form.of(context).validate()){
                        //验证通过提交数据
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("登录11"),
                    ),
                  );
                })
            ),
          ],
        ),
      )
    ],
  ),
)
''';
    final TextEditingController _unameController = TextEditingController();
    final TextEditingController _pwdController = TextEditingController();
    final GlobalKey _formKey = GlobalKey<FormState>();
    ui = Form(
      key: _formKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: <Widget>[
          TextFormField(
            autofocus: true,
            controller: _unameController,
            decoration: const InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              icon: Icon(Icons.person),
            ),
            // 校验用户名
            validator: (v) {
              return v!.trim().isNotEmpty ? null : "用户名不能为空";
            },
          ),
          TextFormField(
            controller: _pwdController,
            decoration: const InputDecoration(
              labelText: "密码",
              hintText: "您的登录密码",
              icon: Icon(Icons.lock),
            ),
            obscureText: true,
            //校验密码
            validator: (v) {
              return v!.trim().length > 5 ? null : "密码不能少于6位";
            },
          ),
          // 登录按钮
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text("登录"),
                    ),
                    onPressed: () {
                      // FormState.validate()：调用此方法后，会调用Form子孙FormField的validate回调，如果有一个校验失败，则返回false，所有校验失败项都会返回用户返回的错误提示。
                      // FormState.save()：调用此方法后，会调用Form子孙FormField的save回调，用于保存表单内容
                      // FormState.reset()：调用此方法后，会将子孙FormField的内容清空
                      // 通过_formKey.currentState 获取FormState后，
                      // 调用validate()方法校验用户名密码是否合法，校验
                      // 通过后再提交数据。
                      if ((_formKey.currentState as FormState).validate()) {
                        //验证通过提交数据
                      }
                    },
                  ),
                ),
                Expanded(
                  //登录按钮的onPressed方法中不能通过Form.of(context)来获取FormState，
                  //原因是，此处的context为FormTestRoute的context，而Form.of(context)是根据所指定context向根去查找，而FormState是在FormTestRoute的子树中，所以不行。
                  //正确的做法是通过Builder来构建登录按钮，Builder会将widget节点的context作为回调参数
                  // 通过Builder来获取ElevatedButton所在widget树的真正context(Element)
                    child:Builder(builder: (context){
                      return ElevatedButton(
                        onPressed: () {
                          //由于本widget也是Form的子代widget，所以可以通过下面方式获取FormState
                          if(Form.of(context).validate()){
                            //验证通过提交数据
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text("登录11"),
                        ),
                      );
                    })
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FormWidget extends Datas {
  @override
  void init() {
    title = "Form";
    list.add(Demo1()..init());
  }
}