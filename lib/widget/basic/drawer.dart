import 'package:flutter/material.dart';

import '../../main.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      Demo1()..init(),
    ]);
  }
}
class Demo1 extends Data{
  @override
  void init() {
    title="drawer";
    code = '''
Scaffold(
  appBar: AppBar(
    title: Text("Flutter App"), ),
  drawer: Drawer(
    child: Text('左侧边栏'),
  ),
  endDrawer: Drawer(
    child: Text('右侧侧边栏'),
  ),
)
''';
    ui = Scaffold(
      appBar: AppBar(
        title: const Text("Flutter App"), ),
      drawer: const Drawer(
        child: Text('左侧边栏'),
      ),
      endDrawer: const Drawer(
        child: Text('右侧侧边栏'),
      ),
    );
  }
}