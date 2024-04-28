import 'package:flutter/cupertino.dart';

import 'menu.dart';
import 'menu_data.dart';

// 管理数据共享，可以自动更新依赖的子孙组件
class MenuProvider extends InheritedWidget {
  MenuProvider({
    super.key,
    required super.child,
    required this.selectKey,
    required this.onSelect,
    required this.opened,
    required this.items,
  });

  bool opened;
  final MenuItemKey selectKey;
  final List<MenuData> items;
  final ValueChanged<MenuData> onSelect;

  static MenuProvider? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MenuProvider>();
  }

  static MenuProvider of(BuildContext context) {
    final MenuProvider? result = maybeOf(context);
    assert(result != null, 'No MenuProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MenuProvider oldWidget) {
    bool shouldNotify = opened != oldWidget.opened ||
        selectKey != oldWidget.selectKey ||
        items.hashCode != oldWidget.items.hashCode;
    // debugPrint("5. check - $shouldNotify - ${items.hashCode} - old ${oldWidget.items.hashCode}");
    return shouldNotify;
  }
}