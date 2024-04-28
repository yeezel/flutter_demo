import 'package:flutter/material.dart';

import 'menu_data.dart';
import 'menu_item.dart';
import 'menu_provider.dart';

class MenuLayout extends StatelessWidget {
  const MenuLayout({super.key});

  @override
  Widget build(BuildContext context) {
    MenuProvider mode = MenuProvider.of(context);
    if(!mode.opened){
      return Container();
    }
    var w = MediaQuery.of(context).size.width * 0.20;// 屏幕宽度的 20%
    return SizedBox(
        width: !mode.opened?0:w>300?300:w,
        child:Drawer(
          child: ListView(
            children: [
              ...mode.items.map((item) => MenuItem(key: ValueKey(item.key), menuData: item)).toList()
            ],
          ),
          // child: ListView.builder(
          //   itemCount: !mode.opened?0:mode.items.length,
          //   itemBuilder: (context, index) {
          //     MenuData item = mode.items[index];
          //     return MenuItem(key: ValueKey<int>(item.key), menuData: item);
          //   },
          // ),
        )
    );
  }
}