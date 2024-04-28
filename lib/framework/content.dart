import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  const Content({super.key, required this.page});
  final Widget? page;
  @override
  Widget build(BuildContext context){
    return Expanded(
      child: page??Container(),
    );
  }
}
