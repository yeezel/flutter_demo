import 'package:flutter/material.dart';
import 'nav/menu.dart';
import 'nav/menu_data.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key, required this.navopen, required this.onSelect, required this.items});
  final ValueNotifier<bool> navopen;
  final ValueChanged<MenuData> onSelect;
  final List<MenuData> items;
  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  var open = true;

  @override
  void initState() {
    widget.navopen.addListener(toggleOpen);
  }
  @override
  void dispose() {
    widget.navopen.removeListener(toggleOpen);
    super.dispose();
  }
  void toggleOpen() {
    setState(() {
      open = !open;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Menu(
      items: widget.items,
      opened: open,
      onSelect: widget.onSelect,
    );
  }
}