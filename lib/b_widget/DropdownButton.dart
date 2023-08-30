import 'package:flutter/material.dart';

import 'main.dart';

class Demo1 extends Data{
  @override
  void init() {
    title="default";
    code = '''
DropdownButton<String>(
  value: selectedOption, // 当前选中的选项
  onChanged: (newValue) {
    setState(() {
      selectedOption = newValue!; // 更新选中的选项
    });
  },
  items: options.map<DropdownMenuItem<String>>((String option) {
    return DropdownMenuItem<String>(
      value: option, // 选项的值，会在onChanged回调中传递
      child: Text(option), // 选项的显示文本
    );
  }).toList(), // 将选项列表转换为DropdownMenuItem列表
)
''';
    ui = const MyDropdownButton();
  }
}

class DropdownButtonWidget extends Datas {
  @override
  void init() {
    title = "DropdownButton";
    list.add(Demo1()..init());
  }
}
class MyDropdownButton extends StatefulWidget {
  const MyDropdownButton({super.key});

  @override
  State<MyDropdownButton> createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  String selectedOption = 'Option 1'; // 当前选中的选项
  List<String> options = ['Option 1', 'Option 2', 'Option 3', 'Option 4']; // 可选的选项

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DropdownButton Example')),
      body: Center(
        child: DropdownButton<String>(
          value: selectedOption, // 当前选中的选项
          onChanged: (newValue) {
            setState(() {
              selectedOption = newValue!; // 更新选中的选项
            });
          },
          items: options.map<DropdownMenuItem<String>>((String option) {
            return DropdownMenuItem<String>(
              value: option, // 选项的值，会在onChanged回调中传递
              child: Text(option), // 选项的显示文本
            );
          }).toList(), // 将选项列表转换为DropdownMenuItem列表
        ),
      ),
    );
  }
}
