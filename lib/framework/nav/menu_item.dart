import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'menu.dart';
import 'menu_data.dart';
import 'menu_provider.dart';
class MenuItem extends StatefulWidget {
  MenuItem({super.key, required this.menuData, this.depth = 0, this.initiallyExpanded = false});

  final MenuData menuData;
  final bool initiallyExpanded;
  int depth;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween = CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _halfTween = Tween<double>(begin: 0.25, end: 0);
  static final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn); //渐进曲线

  late AnimationController _animationController;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 200), vsync: this);
    _iconTurns = _animationController.drive(_halfTween.chain(_easeInTween));
    _heightFactor = _animationController.drive(_easeOutTween);

    // bool isExpanded = PageStorage.maybeOf(context)?.readState(context) as bool? ?? widget.initiallyExpanded;
    // if (isExpanded) {
    //  _animationController.forward();
    // }
    if(widget.menuData.isExpanded || widget.initiallyExpanded){
      _animationController.value = 1.0; //等同forward， 但没有动画
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    Color primaryColor = Theme.of(context).primaryColor;

    MenuProvider model = MenuProvider.of(context);
    MenuItemKey selectKey = model.selectKey;
    MenuData menuData = widget.menuData;
    // debugPrint("menu item build ${menuData.title} - $selectKey - ${menuData.key} - ${menuData.isExpanded}");
    return AnimatedBuilder(
      animation: _animationController.view,
      builder: (BuildContext context, Widget? child) {
        return Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(left: 10.0 * widget.depth),
              title: Text(menuData.title),
              leading: Container(
                width: 40,
                alignment: Alignment.centerRight,
                child:menuData.icon
              ),
              // title: widget.menuData.isExpanded ? Text(menuData.title) : menuData.icon,
              // leading: widget.menuData.isExpanded ? menuData.icon : null,
              trailing: menuData.isChild ? RotationTransition(
                turns: _iconTurns,
                child: const Icon(Icons.expand_more),
              ): null,
              textColor: selectKey == menuData.key ? primaryColor : null,
              iconColor: selectKey == menuData.key ? primaryColor : null,
              onTap: () {
                _toggleExpansion();
                model.onSelect(menuData);
              },
            ),
            ClipRect(
              child: Align(
                alignment: Alignment.center,
                heightFactor: _heightFactor.value,
                child: child,
              ),
            )
          ],
        );
      },
      child: Column(
        children: menuData.children!.map((item) => MenuItem(key: ValueKey(item.key), menuData: item, depth: widget.depth+1)).toList()
      ),
    );

  }

  void _toggleExpansion() {
    setState(() {
      widget.menuData.isExpanded = !widget.menuData.isExpanded;
      if (widget.menuData.isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse().then<void>((void value) {
          if (!mounted) {
            return;
          }
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      // PageStorage.maybeOf(context)?.writeState(context, widget.menuData.isExpanded);
    });
  }

}