import 'package:flutter/material.dart';

import '../../main.dart';

class DrividerWidget extends StatelessWidget {
  const DrividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      DrividerData()..init(),
      DrividerBorderData()..init(),
    ]);
  }
}
class DrividerData extends Data{
  @override
  void init() {
    title="Divider";
    code = '''
const Divider(height: 1.0,indent: 60.0,color: Colors.red,),
''';
    ui = const Column(children: [
        SizedBox( height: 65.0, child: Text("up"),),
        Divider(height: 1.0,indent: 60.0,color: Colors.red,),
        SizedBox( height: 65.0, child: Text("down"),),
    ],);
  }
}

class DrividerBorderData extends Data{
  @override
  void init() {
    title="Divider Border";
    code = '''
DecoratedBox(
  decoration:BoxDecoration(
      border:Border.all(color: Colors.grey.shade200,width: 1.0)
  ),
)
''';
    ui = Column(children: [
      const SizedBox( height: 65.0, child: Text("up"),),
      Container(
        width: double.infinity,
        decoration:BoxDecoration(
            border:Border.all(color: Colors.black,width: 1.0)
        ),
      ),
      const SizedBox( height: 65.0, child: Text("down"),),
    ],);
  }
}
