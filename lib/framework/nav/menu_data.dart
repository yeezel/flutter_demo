import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'menu_icon.dart';

typedef MenuItemKey = int;
class MenuData {
  //显示完整标题
  String title;
  //收缩时的短标题
  String? label;
  MenuItemKey? key;
  Icon? icon;
  List<MenuData>? children;
  bool isExpanded = false;
  String? pageKey;
  Widget? page;

  MenuData(
      {required this.title,
        this.key,
        this.icon,
        this.label,
        this.children,
        this.pageKey,
        this.page
      });

  bool get isChild {
    return children != null && children!.isNotEmpty;
  }

  static List<MenuData> jsonParse(String json){
    List<dynamic> userMap = jsonDecode(json);
    return buildMenuItem(userMap);
  }

  static List<MenuData> buildMenuItem(List<dynamic> datas){
    List<MenuData> tree = [];
    for (Map<String,dynamic> obj in datas){
      List<MenuData> children = [];
      if(obj["children"]!=null){
        children = buildMenuItem(obj["children"]);
      }
      tree.add(MenuData(
        title: obj["title"],
        key: obj["key"],
        icon: Icon(getIconDataFromJson(MenuIcons.iconDatas[obj["icon"]])),
        children: children,
      ));
    }
    return tree;
  }

  // 一个函数，根据JSON Map返回IconData
  static IconData getIconDataFromJson(String? hex) {
    return IconData(
      hex!=null?int.parse(hex):0xe64a,
      fontFamily: 'MaterialIcons',
    );
  }

}