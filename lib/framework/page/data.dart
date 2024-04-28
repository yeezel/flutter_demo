import 'package:flutter/cupertino.dart';

abstract class Data{
  String title="";
  String code="";
  late Widget ui;
  void init();
}