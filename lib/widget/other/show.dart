import 'package:flutter/material.dart';

class ShowWidget extends StatelessWidget {
  const ShowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Show();
  }
}
class Show extends StatefulWidget {
  const Show({
    Key? key,
  }) : super(key: key);
  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> {
  String code = """
Offstage和Visibility的区别是：
1. Offstage隐藏时不占空间，Visibility可以设置隐藏时占据空间也可以不占据空间，默认不隐藏时不占据空间2。
2. Visibility隐藏/可见时能保存组件的状态；Offstage不能保存组件的状态，组件重新加载2。
3. 当Offstage不可见（true）的时候，如果child有动画等，需要手动停掉，Offstage并不会停掉动画等操作2。

Offstage(
  offstage: !show, // 注意取反
  child: const Text('显示'),
),  


Visibility(
  visible: show,
  child: const Text('显示'),
),
""";
  bool show = true;

  setCode(String code) {
    setState(() {
      this.code = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black
          : Colors.white,
      body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverGrid(
                //Grid
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, //Grid按两列显示
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  // childAspectRatio: 1,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    switch(index) {
                      case 1:
                        return getShowView();
                      case 0:
                        return SizedBox(
                          child: Container(
                              alignment: Alignment.center,
                              color: Colors.cyan[100 * (1 % 9)],
                              child: SelectableText(
                                code,
                                style: const TextStyle(fontSize: 16),
                              )
                          ),
                        );
                    }
                  },
                  childCount: 2,
                ),
              ),
            ),
          ]
      ),
    );
  }

  Widget getShowView() {
    return SafeArea(
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    child: const Text('Success Motion Toast'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text("Offstage show = ${!show}"),
                    Offstage(
                      offstage: !show, // 注意取反
                      child: const Text('显示'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Visibility show = $show"),
                    Visibility(
                      visible: show,
                      child: const Text('显示'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}