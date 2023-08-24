import 'package:flutter/material.dart';

import 'main.dart';

class Button1 extends Data{
  @override
  void init() {
    title="ElevatedButton";
    code = '''
//"漂浮"按钮，它默认带有阴影和灰色背景
ElevatedButton(
  child: const Text("normal"),
  onPressed: () => debugPrint("ElevatedButton"),
)
''';
    //"漂浮"按钮，它默认带有阴影和灰色背景
    ui = ElevatedButton(
      child: const Text("normal"),
      onPressed: () => debugPrint("ElevatedButton"),
    );
  }
}
class Button2 extends Data{
  @override
  void init() {
    title="TextButton";
    code = '''
//文本按钮，默认背景透明并不带阴影
TextButton(
  child: const Text("normal"),
  onPressed: () => debugPrint("TextButton"),
)
''';
    //文本按钮，默认背景透明并不带阴影
    ui = TextButton(
      child: const Text("normal"),
      onPressed: () => debugPrint("TextButton"),
    );
  }
}

class Button3 extends Data{
  @override
  void init() {
    title="OutlinedButton";
    code = '''
//默认有一个边框，不带阴影且背景透明，找不到该类
OutlinedButton(
  child: const Text("normal"),
  onPressed: () => debugPrint("ElevatedButton"),
)
''';
    //文本按钮，默认背景透明并不带阴影
    ui = OutlinedButton(
      child: const Text("normal"),
      onPressed: () => debugPrint("ElevatedButton"),
    );
  }
}

class Button4 extends Data{
  @override
  void init() {
    title="IconButton";
    code = '''
IconButton(
  icon: const Icon(Icons.thumb_up),
  onPressed: () => debugPrint("IconButton"),
)
''';
    ui = IconButton(
      icon: const Icon(Icons.thumb_up),
      onPressed: () => debugPrint("IconButton"),
    );
  }
}
class Button5 extends Data{
  @override
  void init() {
    title="ElevatedButton.icon";
    code = '''
ElevatedButton.icon(
  icon: const Icon(Icons.send),
  label: const Text("发送"),
  onPressed: () => debugPrint("ElevatedButton.icon"),
)
''';
    ui = ElevatedButton.icon(
      icon: const Icon(Icons.send),
      label: const Text("发送"),
      onPressed: () => debugPrint("ElevatedButton.icon"),
    );
  }
}

class Button6 extends Data{
  @override
  void init() {
    title="OutlinedButton.icon";
    code = '''
OutlinedButton.icon(
  icon: const Icon(Icons.add),
  label: const Text("添加"),
  onPressed: () => debugPrint("OutlinedButton.icon"),
)
''';
    ui = OutlinedButton.icon(
      icon: const Icon(Icons.add),
      label: const Text("添加"),
      onPressed: () => debugPrint("OutlinedButton.icon"),
    );
  }
}

class Button7 extends Data{
  @override
  void init() {
    title="TextButton.icon";
    code = '''
TextButton.icon(
  icon: const Icon(Icons.add),
  label: const Text("添加"),
  onPressed: () => debugPrint("TextButton.icon"),
)
''';
    ui = TextButton.icon(
      icon: const Icon(Icons.add),
      label: const Text("添加"),
      onPressed: () => debugPrint("TextButton.icon"),
    );
  }
}

class ButtonWidget extends Datas {
  @override
  void init() {
    title = "Button";
    list.add(Button1()..init());
    list.add(Button2()..init());
    list.add(Button3()..init());
    list.add(Button4()..init());
    list.add(Button5()..init());
    list.add(Button6()..init());
    list.add(Button7()..init());
  }
}
