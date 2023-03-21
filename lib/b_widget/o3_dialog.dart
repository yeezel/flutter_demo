import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


/*
No MaterialLocalizations found
原因：showDialog在MaterialApp下，不能自动隐式添加MaterialLocalizations
解决：将showDialog放在非MaterialApp的组件中
参考：
https://github.com/flutter/flutter/issues/18254
https://stackoverflow.com/questions/56275595/no-materiallocalizations-found-myapp-widgets-require-materiallocalizations-to
 */
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Dialog Test")),
        body: Center(
          child: Column(
              children: const <Widget>[
                SizedBox(height: 50,),
                AlertDialogRoute(),
                SizedBox(),
                SimpleDialogRoute(),
                SizedBox(),
                ListViewDialogRoute(),
                SizedBox(),
                CustomDialogRoute(),
                SizedBox(),
                DialogStateManageRoute(),
                SizedBox(),
                BottomSheetDialogRoute(),
                SizedBox(),
                LoadingDialogRoute(),
                SizedBox(),
                LoadingWidthDialogRoute(),
                SizedBox(),
                DatePickerDialogRoute(),
                SizedBox(),
                IOSDatePickerDialogRoute(),
              ]
          ),
        ),
      ),
    );
  }
}

// 如果AlertDialog的内容过长，内容将会溢出，可以用SingleChildScrollView将内容包裹起来
class AlertDialogRoute extends StatelessWidget {
  const AlertDialogRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("AlertDialog 测试"),
      onPressed: () async {
        // 弹出对话框并等待其关闭
        bool? delete = await _showDialog(context);
        if (delete == null) {
          debugPrint("取消删除");
        } else {
          debugPrint("已确认删除");
          //... 删除文件
        }
      },
    );
  }

  Future<bool?> _showDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return _buildDialog(context);
      },
    );
  }

  Widget _buildDialog(BuildContext context) {
    return AlertDialog(
      title: const Text("提示"),
      content: const Text("您确定要删除当前文件吗?"),
      actions: <Widget>[
        TextButton(
          child: const Text("取消"),
          onPressed: () => Navigator.of(context).pop(), //关闭对话框
        ),
        TextButton(
          child: const Text("删除"),
          onPressed: () {
            // ... 执行删除操作
            Navigator.of(context).pop(true); //关闭对话框
          },
        ),
      ],
    );
  }
}

class SimpleDialogRoute extends StatelessWidget {
  const SimpleDialogRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("SimpleDialog 测试"),
      onPressed: () async {
        // 弹出对话框并等待其关闭
        _showDialog(context);
      },
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    int? i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text('美国英语'),
                ),
              ),
            ],
          );
        });

    if (i != null) {
      debugPrint("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
  }
}

class ListViewDialogRoute extends StatelessWidget {
  const ListViewDialogRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("ListView Dialog 测试"),
      onPressed: () async {
        // 弹出对话框并等待其关闭
        _showDialog(context);
      },
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    int? index = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            const ListTile(title: Text("请选择")),
            Expanded(
                child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("$index"),
                      onTap: () => Navigator.of(context).pop(index),
                    );
                  },
                )),
          ],
        );
        //使用AlertDialog会报错
        //return AlertDialog(content: child);
        return Dialog(child: child);
      },
    );
    if (index != null) {
      debugPrint("点击了：$index");
    }
  }
}

//使用showGeneralDialog自定义对话框
//原理是通过Navigator的push方法打开了一个新的对话框路由RawDialogRoute，然后返回了push的返回值
class CustomDialogRoute extends StatelessWidget {
  const CustomDialogRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("自定义 Dialog 测试"),
      onPressed: () async {
        // 弹出对话框并等待其关闭
        showCustomDialog(context: context, builder: (context){
          return AlertDialog(
            title: const Text("提示"),
            content: const Text("您确定要删除当前文件吗?"),
            actions: <Widget>[
              TextButton(
                child: const Text("取消"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: const Text("删除"),
                onPressed: () {
                  // 执行删除操作
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
      },
    );
  }

  Future<T?> showCustomDialog<T>({
    required BuildContext context,
    bool barrierDismissible = true,
    required WidgetBuilder builder,
    ThemeData? theme,
  }) {
    final ThemeData theme = Theme.of(context);
    return showGeneralDialog(
      context: context,
      //构建对话框内部UI
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          }),
        );
      },
      //点击遮罩是否关闭对话框
      barrierDismissible: barrierDismissible,
      // 语义化标签(用于读屏软件)
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      // 遮罩颜色
      barrierColor: Colors.black87, // 自定义遮罩颜色
      // 对话框打开/关闭的动画时长
      transitionDuration: const Duration(milliseconds: 150),
      // 对话框打开/关闭的动画
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }

  //缩放动画
  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // 使用缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }
}

class DialogStateManageRoute extends StatefulWidget {
  const DialogStateManageRoute({super.key});
  @override
  State<StatefulWidget> createState() => DialogStateManageRouteState();

}

class DialogStateManageRouteState extends State<DialogStateManageRoute> {
  bool withTree = false; // 复选框选中状态
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("状态管理 Dialog 测试"),
      onPressed: () async {
        bool? delete = await showDeleteConfirmDialog2();
        if (delete == null) {
          debugPrint("取消删除");
        } else {
          debugPrint("同时删除子目录: $delete");
        }
      },
    );
  }

  Future<bool?> showDeleteConfirmDialog2() {
    withTree = false; // 默认复选框不选中
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text("您确定要删除当前文件吗?"),
              Row(
                children: <Widget>[
                  const Text("同时删除子目录？"),
                  // 无法正常勾选，因为checkbox在dialog里，没有StatefulWidget
                  // Checkbox(
                  //   value: withTree,
                  //   onChanged: (bool? value) {
                  //     //复选框选中状态发生变化时重新构建UI
                  //     setState(() {
                  //       //更新复选框状态
                  //       withTree = !withTree;
                  //     });
                  //   },
                  // ),

                  /*
                   解决方法：
                   1. 单独抽离出StatefulWidget（略过）
                   2. 使用StatefulBuilder方法
                   */

                  // Checkbox( // 依然使用Checkbox组件
                  //   value: withTree,
                  //   onChanged: (bool? value) {
                  //     // 此时context为对话框UI的根Element，我们
                  //     // 直接将对话框UI对应的Element标记为dirty
                  //     // 但会导致整个对话框UI组件全部rebuild
                  //     (context as Element).markNeedsBuild();
                  //     withTree = !withTree;
                  //   },
                  // ),

                  // 最优解
                  // 通过Builder来获得构建Checkbox的`context`，
                  // 这是一种常用的缩小`context`范围的方式
                  Builder(
                    builder: (BuildContext context) {
                      return Checkbox(
                        value: withTree,
                        onChanged: (bool? value) {
                          // setState中调用了Element的markNeedsBuild()方法
                          // 此时context为对话框UI的根Element，我们
                          // 直接将对话框UI对应的Element标记为dirty
                          (context as Element).markNeedsBuild();
                          withTree = !withTree;
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text("删除"),
              onPressed: () {
                //执行删除操作
                Navigator.of(context).pop(withTree);
              },
            ),
          ],
        );
      },
    );
  }
}

//底部菜单列表
class BottomSheetDialogRoute extends StatelessWidget {
  const BottomSheetDialogRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("显示底部菜单列表"),
      onPressed: () async {
        int? type = await _showModalBottomSheet(context);
        debugPrint(type.toString());
      },
    );
  }

  // 弹出底部菜单列表模态对话框
  Future<int?> _showModalBottomSheet(BuildContext context) {
    return showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
        );
      },
    );
  }

}

//Loading框,showDialog已经设置了最小宽度约束，不能调节宽度
class LoadingDialogRoute extends StatelessWidget {
  const LoadingDialogRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("loading"),
      onPressed: () {
        showLoadingDialog(context);
      },
    );
  }

  // 弹出底部菜单列表模态对话框
  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, //false点击遮罩不关闭对话框
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: EdgeInsets.only(top: 26.0),
                child: Text("正在加载，请稍后..."),
              )
            ],
          ),
        );
      },
    );
  }

}

//Loading框,自定义对话框宽度（问题：加载圈不会转）
class LoadingWidthDialogRoute extends StatelessWidget {
  const LoadingWidthDialogRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("loading 自定义宽度"),
      onPressed: () {
        showLoadingDialog(context);
      },
    );
  }

  // 弹出底部菜单列表模态对话框
  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true, //false点击遮罩不关闭对话框
      builder: (context) {
        //使用UnconstrainedBox先抵消showDialog对宽度的约束，然后再使用SizedBox指定宽度
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 280,
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  CircularProgressIndicator(value: .8,),
                  Padding(
                    padding: EdgeInsets.only(top: 26.0),
                    child: Text("正在加载，请稍后..."),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}

//日历框
class DatePickerDialogRoute extends StatelessWidget {
  const DatePickerDialogRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("默认日历对话框"),
      onPressed: () async {
        _showDatePicker(context);
      },
    );
  }

  Future<DateTime?> _showDatePicker(BuildContext context) {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add( //未来30天可选
        const Duration(days: 30),
      ),
    );
  }

}

//IOS风格日历框
class IOSDatePickerDialogRoute extends StatelessWidget {
  const IOSDatePickerDialogRoute({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("IOS风格日历对话框"),
      onPressed: () async {
        _showDatePicker(context);
      },
    );
  }

  Future<DateTime?> _showDatePicker(BuildContext context) {
    var date = DateTime.now();
    return showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            minimumDate: date,
            maximumDate: date.add(
              const Duration(days: 30),
            ),
            maximumYear: date.year + 1,
            onDateTimeChanged: (DateTime value) {
              debugPrint(value.toString());
            },
          ),
        );
      },
    );
  }

}