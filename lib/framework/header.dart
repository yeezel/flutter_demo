import 'package:flutter/material.dart';
import 'navigation.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key, required this.navopen});
  final ValueNotifier<bool> navopen;
  @override
  Widget build(BuildContext context) {
    return AppBar( //导航栏
      title: const Text("App Name"),
      //自定义菜单图标
      leading: Builder(builder: (context) {
        return IconButton(
          icon: const Icon(Icons.dashboard, color: Colors.white), //自定义图标
          onPressed: () {
            // 关闭抽屉菜单
            // Navigator.pop(c.context);
            // Scaffold.of(context).openDrawer();
            // Scaffold.of(context).closeDrawer();
            // c.drawerKey.currentState?.close();
            // nav.toggleOpen();
            navopen.notifyListeners();
          },
        );
      }),
      actions: <Widget>[ //导航栏右侧菜单
        IconButton(icon: const Icon(Icons.share), onPressed: () {}),
      ],
    );
  }

  @override
  // kToolbarHeight AppBar标准高度
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
