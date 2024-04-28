import 'package:flutter/material.dart';

import '../../framework/page/data.dart';
import '../../framework/page/widget_page.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      ElevatedButtonWidget()..init(),
      TextButtonWidget()..init(),
      OutlinedButtonWidget()..init(),
      IconButtonWidget()..init(),
      ElevatedButtonIconWidget()..init(),
      OutlinedButtonIconWidget()..init(),
      TextButtonIconWidget()..init(),
    ]);
  }
}
class ElevatedButtonWidget extends Data{
  @override
  void init() {
    //"漂浮"按钮，它默认带有阴影和灰色背景
    ui = ElevatedButton(
      child: const Text("normal"),
      onPressed: () => debugPrint("ElevatedButton"),
    );
    title="ElevatedButton";
    code = '''
//"漂浮"按钮，它默认带有阴影和灰色背景
ElevatedButton(
  child: const Text("normal"),
  onPressed: () => debugPrint("ElevatedButton"),
)
''';
  }
}
class TextButtonWidget extends Data{
  @override
  void init() {
    //文本按钮，默认背景透明并不带阴影
    ui = TextButton(
      child: const Text("normal"),
      onPressed: () => debugPrint("TextButton"),
    );
    title="TextButton";
    code = '''
//文本按钮，默认背景透明并不带阴影
TextButton(
  child: const Text("normal"),
  onPressed: () => debugPrint("TextButton"),
)
''';
  }
}

class OutlinedButtonWidget extends Data{
  @override
  void init() {
    //文本按钮，默认背景透明并不带阴影
    ui = OutlinedButton(
      child: const Text("normal"),
      onPressed: () => debugPrint("ElevatedButton"),
    );
    title="OutlinedButton";
    code = '''
//默认有一个边框，不带阴影且背景透明，找不到该类
OutlinedButton(
  child: const Text("normal"),
  onPressed: () => debugPrint("ElevatedButton"),
)
''';
  }
}

class IconButtonWidget extends Data{
  @override
  void init() {
    ui = IconButton(
      icon: const Icon(Icons.thumb_up),
      onPressed: () => debugPrint("IconButton"),
    );
    title="IconButton";
    code = '''
IconButton(
  icon: const Icon(Icons.thumb_up),
  onPressed: () => debugPrint("IconButton"),
)
''';
  }
}
class ElevatedButtonIconWidget extends Data{
  @override
  void init() {
    ui = ElevatedButton.icon(
      icon: const Icon(Icons.send),
      label: const Text("发送"),
      onPressed: () => debugPrint("ElevatedButton.icon"),
    );
    title="ElevatedButton.icon";
    code = '''
ElevatedButton.icon(
  icon: const Icon(Icons.send),
  label: const Text("发送"),
  onPressed: () => debugPrint("ElevatedButton.icon"),
)
''';
  }
}

class OutlinedButtonIconWidget extends Data{
  @override
  void init() {
    ui = OutlinedButton.icon(
      icon: const Icon(Icons.add),
      label: const Text("添加"),
      onPressed: () => debugPrint("OutlinedButton.icon"),
    );
    title="OutlinedButton.icon";
    code = '''
OutlinedButton.icon(
  icon: const Icon(Icons.add),
  label: const Text("添加"),
  onPressed: () => debugPrint("OutlinedButton.icon"),
)
''';
  }
}

class TextButtonIconWidget extends Data{
  @override
  void init() {
    ui = TextButton.icon(
      icon: const Icon(Icons.add),
      label: const Text("添加"),
      onPressed: () => debugPrint("TextButton.icon"),
    );
    title="TextButton.icon";
    code = '''
TextButton.icon(
  icon: const Icon(Icons.add),
  label: const Text("添加"),
  onPressed: () => debugPrint("TextButton.icon"),
)
''';
  }
}
