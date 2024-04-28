import 'package:flutter/material.dart';

import 'content.dart';
import 'header.dart';
import 'nav/menu_data.dart';
import 'navigation.dart';

class DemoNav extends StatelessWidget {
  const DemoNav({super.key, required this.items});
  final List<MenuData> items;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return ResponsiveLayout(viewportWidth: constraints.maxWidth, items: items);
    });
  }
}

class ResponsiveLayout extends StatefulWidget {
  const ResponsiveLayout({
    Key? key,
    required this.viewportWidth, required this.items,
  }) : super(key: key);

  final double viewportWidth;
  final List<MenuData> items;
  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();

}


class _ResponsiveLayoutState extends State<ResponsiveLayout> {

  final ValueNotifier<bool> navopen = ValueNotifier<bool>(true);
  Widget? page;

  void computeGridConfig() {
    if (widget.viewportWidth > 500) {

    } else {

    }
  }

  void onSelect(MenuData value) {
    setState(() {
      page = value.page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(navopen:navopen),
      body: Row(
        children: [
          Navigation(navopen:navopen, items: widget.items, onSelect: onSelect,),
          Content(page: page,),
        ],
      ),
    );
  }
}
