import 'package:flutter/material.dart';

import '../../main.dart';

class SingleChildScrollViewWidget extends StatelessWidget {
  const SingleChildScrollViewWidget({super.key});

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
    title="default";
    code = '''
/*
SingleChildScrollView只应在期望的内容不会超过屏幕太多时使用，因为SingleChildScrollView不支持基于 Sliver 的延迟加载模型
 */
class SingleChildScrollViewRoute extends StatelessWidget {
  SingleChildScrollViewRoute({super.key});
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(
      controller: _scrollController,
      // 显示进度条
      child: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            //动态创建一个List<Widget>
            children: str
                .split("")
            //每一个字母都用一个Text显示,字体为原来的两倍
                .map((c) => Text(
              c,
              textScaleFactor: 2.0,
            ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
''';
    ui = SingleChildScrollViewRoute();
  }
}

class SingleChildScrollViewRoute extends StatelessWidget {
  SingleChildScrollViewRoute({super.key});
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(
      controller: _scrollController,
      // 显示进度条
      child: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            //动态创建一个List<Widget>
            children: str
                .split("")
            //每一个字母都用一个Text显示,字体为原来的两倍
                .map((c) => Text(
              c,
              textScaleFactor: 2.0,
            ))
                .toList(),
          ),
        ),
      ),
    );
  }
}