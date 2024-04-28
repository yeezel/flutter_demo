import 'package:flutter/material.dart';

import '../../framework/page/data.dart';
import '../../framework/page/widget_page.dart';

/*
错误：
RenderCustomMultiChildLayoutBox object was given an infinite size during layout.

使用 Expanded 或 Flexible 包裹： 如果 RenderCustomMultiChildLayoutBox 是 Row 或 Column 的子组件，
尝试使用 Expanded 或 Flexible 包裹它，这样可以告诉Flutter如何根据可用空间来调整子组件的大小
 */

class FlexLayout extends StatelessWidget {
  const FlexLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      FlexHorizontalWidget()..init(),
      FlexVerticalWidget()..init(),
    ]);
  }

}

class FlexHorizontalWidget extends Data{
  @override
  void init() {
    //Flex的两个子widget按1：2来占据水平空间
    ui = Flex(
      // 水平分布
      direction: Axis.horizontal,
      children: <Widget>[
        //Expanded 只能作为 Flex 的孩子（否则会报错），它可以按比例“扩伸”Flex子组件所占用的空间
        Expanded(
          //弹性系数，如果为 0 或null，则child是没有弹性的，即不会被扩伸占用的空间。
          // 如果大于0，所有的Expanded按照其 flex 的比例来分割主轴的全部空闲空间
          flex: 1,
          child: Container(
            height: 30.0,
            color: Colors.red,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 30.0,
            color: Colors.green,
          ),
        ),
      ],
    );
    title="Flex Horizontal";
    code = '''
//弹性布局
//Flex组件可以沿着水平或垂直方向排列子组件，如果你知道主轴方向，使用Row或Column会方便一些，
// 因为Row和Column都继承自Flex，参数基本相同，所以能使用Flex的地方基本上都可以使用Row或Column
//Flex的两个子widget按1：2来占据水平空间
Flex(
  // 水平分布
  direction: Axis.horizontal,
  children: <Widget>[
    //Expanded 只能作为 Flex 的孩子（否则会报错），它可以按比例“扩伸”Flex子组件所占用的空间
    Expanded(
      //弹性系数，如果为 0 或null，则child是没有弹性的，即不会被扩伸占用的空间。
      // 如果大于0，所有的Expanded按照其 flex 的比例来分割主轴的全部空闲空间
      flex: 1,
      child: Container(
        height: 30.0,
        color: Colors.red,
      ),
    ),
    Expanded(
      flex: 2,
      child: Container(
        height: 30.0,
        color: Colors.green,
      ),
    ),
  ],
)
''';
  }
}

class FlexVerticalWidget extends Data{
  @override
  void init() {
    ui = Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            height: 100.0,
            //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30.0,
                    color: Colors.red,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
    title="Flex vertical";
    code = '''
//Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
Flex(
  direction: Axis.vertical,
  children: <Widget>[
    Expanded(
      flex: 2,
      child: Container(
        height: 30.0,
        color: Colors.red,
      ),
    ),
    const Spacer(
      flex: 1,
    ),
    Expanded(
      flex: 1,
      child: Container(
        height: 30.0,
        color: Colors.green,
      ),
    ),
  ],
)
''';
  }
}