import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'menu_icon.dart';
import 'menu_layout.dart';
import 'menu_data.dart';
import 'menu_provider.dart';

class Menu extends StatefulWidget {
  final List<MenuData> items;
  final ValueChanged<MenuData>? onSelect;
  final bool opened;

  const Menu({super.key, this.onSelect, required this.items, this.opened = true});
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  MenuItemKey selectKey = -9919;
  var r = Random();

  void onSelect(MenuData data) {
    setState(() {
      selectKey = data.key!;
    });
    if (widget.onSelect != null) {
      widget.onSelect!(data);
    }
  }
  @override
  void initState() {
    preprocessing(widget.items);
    super.initState();
  }

  // 预处理数据
  void preprocessing(List<MenuData> items){
    for(MenuData data in items){
      data.children ??= [];
      data.key ??= UniqueKey().hashCode;
      data.icon ??= Icon(MenuData.getIconDataFromJson(MenuIcons.iconDatas.values.toList()[r.nextInt(MenuIcons.iconDatas.length)]));
      if(data.isChild) preprocessing(data.children!);
    }
  }

  randomGen(min, max) {
    //nextInt 方法生成一个从 0（包括）到 max（不包括）的非负随机整数
    var x = Random().nextInt(max) + min;

    //如果您不想返回整数，只需删除 floor() 方法
    return x.floor();
  }

  @override
  Widget build(BuildContext context) {

    return MenuProvider(
      onSelect: onSelect,
      items: widget.items,
      opened: widget.opened,
      selectKey: selectKey,
      child: const MenuLayout(),
    );
  }
}