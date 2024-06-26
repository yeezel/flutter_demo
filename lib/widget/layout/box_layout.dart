import 'package:flutter/material.dart';

import '../../framework/page/data.dart';
import '../../framework/page/widget_page.dart';

class BoxLayout extends StatelessWidget {
  const BoxLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      ConstrainedBoxWidget()..init(),
      UnconstrainedBoxWidget()..init(),
      SizedBoxWidget()..init(),
      BoxConstraintsTightForWidget()..init(),
      BoxAndBoxWidget()..init(),
    ]);
  }

}

class ConstrainedBoxWidget extends Data{
  @override
  void init() {
    ui = ConstrainedBox(
      constraints: const BoxConstraints(
          minWidth: double.infinity, //宽度尽可能大
          minHeight: 50.0 //最小高度为50像素
      ),
      child: Container(
        height: 5.0,
        child: const DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
        ) ,
      ),
    );
    title="ConstrainedBox default";
    code = '''
//box布局约束
ConstrainedBox(
  constraints: const BoxConstraints(
      minWidth: double.infinity, //宽度尽可能大
      minHeight: 50.0 //最小高度为50像素
  ),
  child: Container(
    height: 5.0,
    child: const DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    ) ,
  ),
)
''';
  }
}

class SizedBoxWidget extends Data{
  @override
  void init() {
    ui = const SizedBox(
        width: 80.0,
        height: 80.0,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.black),
        )
    );
    title="SizedBox";
    code = '''
//box布局约束
// SizedBox只是ConstrainedBox的一个定制/
const SizedBox(
    width: 80.0,
    height: 80.0,
    child: DecoratedBox(
      decoration: BoxDecoration(color: Colors.black),
    )
),
''';
  }
}

class BoxConstraintsTightForWidget extends Data{
  @override
  void init() {
    ui = ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 80.0,height: 80.0),
      child: const DecoratedBox(
        decoration: BoxDecoration(color: Colors.yellow),
      ),
    );
    title="BoxConstraints.tightFor";
    code = '''
ConstrainedBox(
      constraints: const BoxConstraints.tightFor(width: 80.0,height: 80.0),
      child: const DecoratedBox(
        decoration: BoxDecoration(color: Colors.yellow),
      ),
    )
''';
  }
}

class BoxAndBoxWidget extends Data{
  @override
  void init() {
    ui = ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
        child: const DecoratedBox(
          decoration: BoxDecoration(color: Colors.green),
        ),
      ),
    );
    title="BoxAndBox";
    code = '''
//有多重限制时，对于minWidth和minHeight来说，是取父子中相应数值较大的
ConstrainedBox(
  constraints: const BoxConstraints(minWidth: 60.0, minHeight: 60.0), //父
  child: ConstrainedBox(
    constraints: const BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
    child: const DecoratedBox(
      decoration: BoxDecoration(color: Colors.green),
    ),
  ),
),
''';
  }
}

class UnconstrainedBoxWidget extends Data{
  @override
  void init() {
    // UnconstrainedBox 的子组件将不再受到父组件约束，在"去除"多重限制的时候也许会有帮助
    ui = ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
        //注意，UnconstrainedBox对父组件限制的“去除”并非是真正的去除：
        // 虽然红色区域大小是90×20，但上方仍然有80的空白空间。
        // 也就是说父限制的minHeight(100.0)仍然是生效的，
        // 只不过它不影响最终子元素redBox的大小，但仍然还是占有相应的空间，
        // 可以认为此时的父ConstrainedBox是作用于子UnconstrainedBox上，
        // 而redBox只受子ConstrainedBox限制.
        // UnconstrainedBox 虽然在其子组件布局时可以取消约束（子组件可以为无限大），
        // 但是 UnconstrainedBox 自身是受其父组件约束的，所以当 UnconstrainedBox 随着其子组件变大后，
        // 如果UnconstrainedBox 的大小超过它父组件约束时，也会导致溢出报错
        child: UnconstrainedBox( //“去除”父级限制
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
            child: const DecoratedBox(
              decoration: BoxDecoration(color: Colors.blue),
            ),
          ),
        )
    );
    title="UnconstrainedBox";
    code = '''
// UnconstrainedBox 的子组件将不再受到父组件约束，在"去除"多重限制的时候也许会有帮助
ConstrainedBox(
    constraints: const BoxConstraints(minWidth: 60.0, minHeight: 100.0),  //父
    //注意，UnconstrainedBox对父组件限制的“去除”并非是真正的去除：
    // 虽然红色区域大小是90×20，但上方仍然有80的空白空间。
    // 也就是说父限制的minHeight(100.0)仍然是生效的，
    // 只不过它不影响最终子元素redBox的大小，但仍然还是占有相应的空间，
    // 可以认为此时的父ConstrainedBox是作用于子UnconstrainedBox上，
    // 而redBox只受子ConstrainedBox限制.
    // UnconstrainedBox 虽然在其子组件布局时可以取消约束（子组件可以为无限大），
    // 但是 UnconstrainedBox 自身是受其父组件约束的，所以当 UnconstrainedBox 随着其子组件变大后，
    // 如果UnconstrainedBox 的大小超过它父组件约束时，也会导致溢出报错
    child: UnconstrainedBox( //“去除”父级限制
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 90.0, minHeight: 20.0),//子
        child: const DecoratedBox(
          decoration: BoxDecoration(color: Colors.blue),
        ),
      ),
    )
)
''';
  }
}
