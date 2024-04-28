import 'package:flutter/material.dart';

import 'data.dart';
import 'sliver_header.dart';

class WidgetPage extends StatelessWidget {
  WidgetPage({super.key,
    required this.list
  });
  List<Data> list;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: [
          for(var i = 0 ; i<list.length; i++)
            ...buildWidget(list[i]),
        ]
    );
  }
  List<Widget> buildWidget(Data data) {
    return [
      SliverPersistentHeader(
        pinned: true,
        delegate: SliverHeaderDelegate(
          maxHeight: 20,
          child: Container(
            color: Colors.lightBlue.shade200,
            alignment: Alignment.centerLeft,
            child: Text(data.title),
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.all(8.0),
        sliver: SliverGrid(
          //Grid
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //Grid按两列显示
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            // childAspectRatio: 2.0,
          ),
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              switch(index) {
                case 1:
                  return Container(
                      alignment: Alignment.center,
                      child: data.ui
                  );
                case 0:
                  return SizedBox(
                    child: Container(
                        alignment: Alignment.center,
                        color: Colors.cyan[100 * (1 % 9)],
                        child: SelectableText(
                          data.code,
                          style: const TextStyle(fontSize: 16),
                        )
                    ),
                  );
              }
            },
            childCount: 2,
          ),
        ),
      ),
    ];
  }
}