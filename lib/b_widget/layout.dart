import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

import 'main.dart';
class Demo1 extends Data{
  @override
  void init() {
    title="box layout";
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
),

// SizedBox只是ConstrainedBox的一个定制/
const SizedBox(
    width: 80.0,
    height: 80.0,
    child: DecoratedBox(
      decoration: BoxDecoration(color: Colors.black),
    )
),
ConstrainedBox(
  constraints: const BoxConstraints.tightFor(width: 80.0,height: 80.0),
  child: const DecoratedBox(
    decoration: BoxDecoration(color: Colors.yellow),
  ),
),

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
    ui = const Box();
  }
}
class Demo2 extends Data{
  @override
  void init() {
    title="Row_Column";
    code = '''
//线性布局
//缺点：超出屏幕不会折行
const Row(
  //表示子组件在Row所占用的水平空间内对齐方式，如果mainAxisSize值为MainAxisSize.min，
  // 则此属性无意义，因为子组件的宽度等于Row的宽度。
  // 只有当mainAxisSize的值为MainAxisSize.max时，此属性才有意义，
  // MainAxisAlignment.start表示沿textDirection的初始方向对齐，
  // 如textDirection取值为TextDirection.ltr时，则MainAxisAlignment.start表示左对齐，
  // textDirection取值为TextDirection.rtl时表示从右对齐。
  // 而MainAxisAlignment.end和MainAxisAlignment.start正好相反；
  // MainAxisAlignment.center表示居中对齐。
  // 可以这么理解：textDirection是mainAxisAlignment的参考系。
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text(" hello world "),
    Text(" I am Jack "),
  ],
),

//由于mainAxisSize值为MainAxisSize.min，Row的宽度等于两个Text的宽度和，所以对齐是无意义的，所以会从左往右显示
const Row(
  //表示Row在主轴(水平)方向占用的空间，默认是MainAxisSize.max，表示尽可能多的占用水平方向的空间，
  // 此时无论子 widgets 实际占用多少水平空间，Row的宽度始终等于水平方向的最大宽度；
  // 而MainAxisSize.min表示尽可能少的占用水平空间，当子组件没有占满水平剩余空间，则Row的实际宽度等于所有子组件占用的的水平空间；
  mainAxisSize: MainAxisSize.min,
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text(" hello world "),
    Text(" I am Jack "),
  ],
),

const Row(
  mainAxisAlignment: MainAxisAlignment.end,
  //表示水平方向子组件的布局顺序(是从左往右还是从右往左)，
  //默认为系统当前Locale环境的文本方向(如中文、英语都是从左往右，而阿拉伯语是从右往左)。
  textDirection: TextDirection.rtl,
  children: <Widget>[
    Text(" hello world "),
    Text(" I am Jack "),
  ],
),

const Row(
  //表示子组件在纵轴方向的对齐方式，Row的高度等于子组件中最高的子元素高度，
  // 它的取值和MainAxisAlignment一样(包含start、end、 center三个值)，
  // 不同的是crossAxisAlignment的参考系是verticalDirection，
  // 即verticalDirection值为VerticalDirection.down时crossAxisAlignment.start指顶部对齐，
  // verticalDirection值为VerticalDirection.up时，crossAxisAlignment.start指底部对齐；
  // 而crossAxisAlignment.end和crossAxisAlignment.start正好相反；
  crossAxisAlignment: CrossAxisAlignment.start,
  //表示Row纵轴（垂直）的对齐方向，默认是VerticalDirection.down，表示从上到下。
  verticalDirection: VerticalDirection.up,
  children: <Widget>[
    Text(
      " hello world ",
      style: TextStyle(fontSize: 30.0),
    ),
    Text(" I am Jack "),
  ],
),

//特殊情况，Row里面嵌套Row，或者Column里面再嵌套Column，那么只有最外面的Row或Column会占用尽可能大的空间，里面Row或Column所占用的空间为实际大小
Container(
  color: Colors.green,
  child: Padding(
    padding: const EdgeInsets.all(66.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
      children: <Widget>[
        Container(
          color: Colors.red,
          child: const Column(
            mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
            children: <Widget>[
              Text("hello world "),
              Text("I am Jack "),
            ],
          ),
        ),
      ],
    ),
  ),
)
''';
    ui = const RowColumn();
  }
}

class Demo3 extends Data{
  @override
  void init() {
    title="Flex_Expanded";
    code = '''
//弹性布局
//Flex组件可以沿着水平或垂直方向排列子组件，如果你知道主轴方向，使用Row或Column会方便一些，
// 因为Row和Column都继承自Flex，参数基本相同，所以能使用Flex的地方基本上都可以使用Row或Column
Column(
  children: <Widget>[
    //Flex的两个子widget按1：2来占据水平空间
    Flex(
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
    ),
    
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
)
''';
    ui = const FlexExpanded();
  }
}
class Demo4 extends Data{
  @override
  void init() {
    title="Wrap";
    code = '''
//流式布局
//超出屏幕显示范围会自动折行的布局称为流式布局
Wrap(
  spacing: 8.0, // 主轴(水平)方向间距
  runSpacing: 4.0, // 纵轴（垂直）方向间距
  alignment: WrapAlignment.center, //沿主轴方向居中
  children: <Widget>[
    Chip(
      avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
      label: Text('Hamilton'),
    ),
    Chip(
      avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
      label: Text('Lafayette'),
    ),
    Chip(
      avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
      label: Text('Mulligan'),
    ),
    Chip(
      avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
      label: Text('Laurens'),
    ),
  ],
)
''';
    ui = const WrapLayout();
  }
}
class Demo5 extends Data{
  @override
  void init() {
    title="flow";
    code = '''
//流式布局
//我们一般很少会使用Flow，因为其过于复杂，需要自己实现子 widget 的位置转换，在很多场景下首先要考虑的是Wrap是否满足需求。
// Flow主要用于一些需要自定义布局策略或性能要求较高(如动画中)的场景。
// 优点：性能好，灵活
// 缺点：使用复杂，不能自适应子组件大小，必须通过指定父容器大小或实现TestFlowDelegate的getSize返回固定大小。
Flow(
  delegate: FlowDelegateLayout(margin: const EdgeInsets.all(10.0)),
  children: <Widget>[
    Container(width: 80.0, height:80.0, color: Colors.red,),
    Container(width: 80.0, height:80.0, color: Colors.green,),
    Container(width: 80.0, height:80.0, color: Colors.blue,),
    Container(width: 80.0, height:80.0,  color: Colors.yellow,),
    Container(width: 80.0, height:80.0, color: Colors.brown,),
    Container(width: 80.0, height:80.0,  color: Colors.purple,),
  ],
)    

class FlowDelegateLayout extends FlowDelegate {
  EdgeInsets margin;

  FlowDelegateLayout({this.margin = EdgeInsets.zero});

  double width = 0;
  double height = 0;

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 指定Flow的大小，简单起见我们让宽度竟可能大，但高度指定为200，
    // 实际开发中我们需要根据子元素所占用的具体宽高来设置Flow大小
    return const Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
''';
    ui = Flow(
      delegate: FlowDelegateLayout(margin: const EdgeInsets.all(10.0)),
      children: <Widget>[
        Container(width: 80.0, height:80.0, color: Colors.red,),
        Container(width: 80.0, height:80.0, color: Colors.green,),
        Container(width: 80.0, height:80.0, color: Colors.blue,),
        Container(width: 80.0, height:80.0,  color: Colors.yellow,),
        Container(width: 80.0, height:80.0, color: Colors.brown,),
        Container(width: 80.0, height:80.0,  color: Colors.purple,),
      ],
    );
  }
}

class Demo6 extends Data{
  @override
  void init() {
    title="Stack_Positioned";
    code = '''
//层叠布局
//stack允许子组件堆叠，而Positioned用于根据Stack的四个角来确定子组件的位置
//这两个组件实现绝对定位
class StackPositioned extends StatelessWidget {
  const StackPositioned({super.key});

  @override
  Widget build(BuildContext context) {
    //定义一个controller
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
          fit: StackFit.expand, //未定位widget占满Stack整个空间
          children: <Widget>[
            Container(
              color: Colors.red,
              child: const Text("Hello world",style: TextStyle(color: Colors.white)),
            ),
            const Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            const Positioned(
              top: 18.0,
              child: Text("Your friend"),
            )
          ],
        ),
      ),
    );
  }
}
''';
    ui = const StackPositioned();
  }
}

class Demo7 extends Data{
  @override
  void init() {
    title="align";
    code = '''
//对齐与相对定位
//只想简单的调整一个子元素在父元素中的位置的话，使用Align组件
//Align和Stack区别：
// 1. 定位参考系统不同；Stack/Positioned定位的的参考系可以是父容器矩形的四个顶点；而Align则需要先通过alignment 参数来确定坐标原点，不同的alignment会对应不同原点，最终的偏移是需要通过alignment的转换公式来计算出。
// 2. Stack可以有多个子元素，并且子元素可以堆叠，而Align只能有一个子元素，不存在堆叠。
class AlignLayout extends StatelessWidget {
  const AlignLayout({super.key});

  @override
  Widget build(BuildContext context) {
    //定义一个controller
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Container(
          // height: 120.0,
          // width: 120.0,
          color: Colors.blue.shade50,
          child: const Align(
            //widthFactor和heightFactor是两个缩放因子，会分别乘以子元素的宽、高，最终的结果就是Align 组件的宽高
            //如果值为null，则组件的宽高将会占用尽可能多的空间
            //以下设置等同于height：120，width：120。  widthFactor/heightFactor * size = 120
            widthFactor: 2,
            heightFactor: 2,
            alignment: Alignment.topRight,

            //Alignment Widget会以矩形的中心点作为坐标原点，值从-1到1分别代表矩形左边到右边的距离和顶部到底边的距离
            //如Alignment(-1.0, -1.0) 代表矩形的左侧顶点，而Alignment(1.0, 1.0)代表右侧底部终点，而Alignment(1.0, -1.0) 则正是右侧顶点
            //Alignment可以通过其坐标转换公式将其坐标转为子元素的具体偏移坐标：(Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight/2+childHeight/2)
            // alignment: Alignment(1,0.0),

            //和 Alignment唯一的区别就是坐标原点不同！FractionalOffset 的坐标原点为矩形的左侧顶点
            //FractionalOffset的坐标转换公式为：实际偏移 = (FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)
            // alignment: FractionalOffset(0.2, 0.6),
            child: FlutterLogo(
              size: 60,
            ),
          ),
        )
      ),
    );
  }
}
''';
    ui = const AlignLayout();
  }
}
class Demo8 extends Data{
  @override
  void init() {
    title="center";
    code = '''
//Center继承自Align，当widthFactor或heightFactor为null时组件的宽高将会占用尽可能多的空间
class CenterLayout extends StatelessWidget {
  const CenterLayout({super.key});

  @override
  Widget build(BuildContext context) {
    //定义一个controller
    return const Center(
      child: Column(
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              child: Text("xxx"),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              widthFactor: 1,
              heightFactor: 1,
              child: Text("xxx"),
            ),
          )
        ],
      ),
    );
  }
}
''';
    ui = const CenterLayout();
  }
}
class Demo9 extends Data{
  @override
  void init() {
    title="LayoutBuilder";
    code = '''
//实现一个响应式的 Column 组件 ResponsiveColumn，它的功能是当当前可用的宽度小于 200 时，将子组件显示为一列，否则显示为两列。
//使用场景：
//1. 可以使用 LayoutBuilder 来根据设备的尺寸来实现响应式布局。
//2. LayoutBuilder 可以帮我们高效排查问题。比如我们在遇到布局问题或者想调试组件树中某一个节点布局的约束时 LayoutBuilder 就很有用。
class LayoutBuilderRoute extends StatelessWidget {
  const LayoutBuilderRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var children = List.filled(6, const Text("A"));
    // Column在本示例中在水平方向的最大宽度为屏幕的宽度
    return Column(
      children: [
        // 限制宽度为190，小于 200
        SizedBox(width: 190, child: ResponsiveColumn(children: children)),
        ResponsiveColumn(children: children),
        //打印布局时的约束信息
        const LayoutLogPrint(child:Text("xx"))
      ],
    );
  }
}

class ResponsiveColumn extends StatelessWidget {
  const ResponsiveColumn({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // 通过 LayoutBuilder 拿到父组件传递的约束，然后判断 maxWidth 是否小于200
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 200) {
          // 最大宽度小于200，显示单列
          return Column(mainAxisSize: MainAxisSize.min, children: children);
        } else {
          // 大于200，显示双列
          var children = <Widget>[];
          for (var i = 0; i < children.length; i += 2) {
            if (i + 1 < children.length) {
              children.add(Row(
                mainAxisSize: MainAxisSize.min,
                children: [children[i], children[i + 1]],
              ));
            } else {
              children.add(children[i]);
            }
          }
          return Column(mainAxisSize: MainAxisSize.min, children: children);
        }
      },
    );
  }
}

class LayoutLogPrint<T> extends StatelessWidget {
  const LayoutLogPrint({
    Key? key,
    this.tag,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final T? tag; //指定日志tag

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      // assert在编译release版本时会被去除
      assert(() {
        debugPrint('\${tag ?? key ?? child}: \$constraints');
        return true;
      }());
      return child;
    });
  }
}
''';
    ui = const LayoutBuilderRoute();
  }
}

class Demo10 extends Data{
  @override
  void init() {
    title="custom";
    code = '''
//获取组件大小和位置
class AfterLayoutRoute extends StatefulWidget {
  const AfterLayoutRoute({Key? key}) : super(key: key);

  @override
  State<AfterLayoutRoute> createState() => _AfterLayoutRouteState();
}

class _AfterLayoutRouteState extends State<AfterLayoutRoute> {
  String _text = 'flutter 实战 ';
  Size _size = Size.zero;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(
            builder: (context) {
              return GestureDetector(
                child: const Text(
                  'Text1: 点我获取我的大小',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () => debugPrint('Text1: \${context.size}'),
              );
            },
          ),
        ),
        AfterLayout(
          callback: (RenderAfterLayout ral) {
            debugPrint('Text2： \${ral.size}, \${ral.offset}');
          },
          child: const Text('Text2：flutter@wendux'),
        ),
        Builder(builder: (context) {
          return Container(
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            width: 100,
            height: 100,
            child: AfterLayout(
              callback: (RenderAfterLayout ral) {
                Offset offset = ral.localToGlobal(
                  Offset.zero,
                  ancestor: context.findRenderObject(),
                );
                debugPrint('A 在 Container 中占用的空间范围为：\${offset & ral.size}');
              },
              child: const Text('A'),
            ),
          );
        }),
        const Divider(),
        AfterLayout(
          child: Text(_text),
          callback: (RenderAfterLayout value) {
            setState(() {
              //更新尺寸信息
              _size = value.size;
            });
          },
        ),
        //显示上面 Text 的尺寸
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Text size: \$_size ',
            style: const TextStyle(color: Colors.blue),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _text += 'flutter 实战 ';
            });
          },
          child: const Text('追加字符串'),
        ),
      ],
    );
  }
}

class AfterLayout extends SingleChildRenderObjectWidget {
  const AfterLayout({
    Key? key,
    required this.callback,
    Widget? child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderAfterLayout(callback);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderAfterLayout renderObject) {
    renderObject.callback = callback;
  }
  /// [callback] will be triggered after the layout phase ends.
  final ValueSetter<RenderAfterLayout> callback;
}

class RenderAfterLayout extends RenderProxyBox {
  RenderAfterLayout(this.callback);

  ValueSetter<RenderAfterLayout> callback;

  @override
  void performLayout() {
    super.performLayout();
    // 不能直接回调callback，原因是当前组件布局完成后可能还有其它组件未完成布局
    // 如果callback中又触发了UI更新（比如调用了 setState）则会报错。因此，我们
    // 在 frame 结束的时候再去触发回调。
    // callback(this);
    SchedulerBinding.instance
        .addPostFrameCallback((timeStamp) => callback(this));

  }

  /// 组件在在屏幕坐标中的起始偏移坐标
  Offset get offset => localToGlobal(Offset.zero);
  /// 组件在屏幕上占有的矩形空间区域
  Rect get rect => offset & size;
}
''';
    ui = const AfterLayoutRoute();
  }
}
class LayoutWidget extends Datas {
  @override
  void init() {
    title = "Layout";
    list.add(Demo1()..init());
    list.add(Demo2()..init());
    list.add(Demo3()..init());
    list.add(Demo4()..init());
    list.add(Demo5()..init());
    list.add(Demo6()..init());
    list.add(Demo7()..init());
    list.add(Demo8()..init());
    list.add(Demo9()..init());
    list.add(Demo10()..init());
  }
}

class Box extends StatelessWidget {
  const Box({super.key});

  @override
  Widget build(BuildContext context) {
    //定义一个controller
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ConstrainedBox(
          constraints: const BoxConstraints(
              minWidth: double.infinity, //宽度尽可能大
              minHeight: 50.0 //最小高度为50像素
          ),
          child: const SizedBox(
            height: 5.0,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
            ) ,
          ),
        ),
        // SizedBox只是ConstrainedBox的一个定制/
        const SizedBox(
            width: 80.0,
            height: 80.0,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.black),
            )
        ),
        ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 80.0,height: 80.0),
          child: const DecoratedBox(
            decoration: BoxDecoration(color: Colors.yellow),
          ),
        ),
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
      ],
    );
  }
}

class RowColumn extends StatelessWidget {
  const RowColumn({super.key});

  @override
  Widget build(BuildContext context) {
    //定义一个controller
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          //Row和Column除特殊情况外都只会在主轴方向占用尽可能大的空间，而纵轴的长度则取决于他们最大子元素的长度。
          child: Column(
            //测试Row对齐方式，排除Column默认居中对齐的干扰
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Row(
                //表示子组件在Row所占用的水平空间内对齐方式，如果mainAxisSize值为MainAxisSize.min，
                // 则此属性无意义，因为子组件的宽度等于Row的宽度。
                // 只有当mainAxisSize的值为MainAxisSize.max时，此属性才有意义，
                // MainAxisAlignment.start表示沿textDirection的初始方向对齐，
                // 如textDirection取值为TextDirection.ltr时，则MainAxisAlignment.start表示左对齐，
                // textDirection取值为TextDirection.rtl时表示从右对齐。
                // 而MainAxisAlignment.end和MainAxisAlignment.start正好相反；
                // MainAxisAlignment.center表示居中对齐。
                // 可以这么理解：textDirection是mainAxisAlignment的参考系。
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(" hello world "),
                  Text(" I am Jack "),
                ],
              ),
              //由于mainAxisSize值为MainAxisSize.min，Row的宽度等于两个Text的宽度和，所以对齐是无意义的，所以会从左往右显示
              const Row(
                //表示Row在主轴(水平)方向占用的空间，默认是MainAxisSize.max，表示尽可能多的占用水平方向的空间，
                // 此时无论子 widgets 实际占用多少水平空间，Row的宽度始终等于水平方向的最大宽度；
                // 而MainAxisSize.min表示尽可能少的占用水平空间，当子组件没有占满水平剩余空间，则Row的实际宽度等于所有子组件占用的的水平空间；
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(" hello world "),
                  Text(" I am Jack "),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                //表示水平方向子组件的布局顺序(是从左往右还是从右往左)，
                //默认为系统当前Locale环境的文本方向(如中文、英语都是从左往右，而阿拉伯语是从右往左)。
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  Text(" hello world "),
                  Text(" I am Jack "),
                ],
              ),
              const Row(
                //表示子组件在纵轴方向的对齐方式，Row的高度等于子组件中最高的子元素高度，
                // 它的取值和MainAxisAlignment一样(包含start、end、 center三个值)，
                // 不同的是crossAxisAlignment的参考系是verticalDirection，
                // 即verticalDirection值为VerticalDirection.down时crossAxisAlignment.start指顶部对齐，
                // verticalDirection值为VerticalDirection.up时，crossAxisAlignment.start指底部对齐；
                // 而crossAxisAlignment.end和crossAxisAlignment.start正好相反；
                crossAxisAlignment: CrossAxisAlignment.start,
                //表示Row纵轴（垂直）的对齐方向，默认是VerticalDirection.down，表示从上到下。
                verticalDirection: VerticalDirection.up,
                children: <Widget>[
                  Text(
                    " hello world ",
                    style: TextStyle(fontSize: 30.0),
                  ),
                  Text(" I am Jack "),
                ],
              ),
              //特殊情况，Row里面嵌套Row，或者Column里面再嵌套Column，那么只有最外面的Row或Column会占用尽可能大的空间，里面Row或Column所占用的空间为实际大小
              Container(
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(66.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
                    children: <Widget>[
                      Container(
                        color: Colors.red,
                        child: const Column(
                          mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
                          children: <Widget>[
                            Text("hello world "),
                            Text("I am Jack "),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FlexExpanded extends StatelessWidget {
  const FlexExpanded({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //Flex的两个子widget按1：2来占据水平空间
        Flex(
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
        ),
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
  }
}

class WrapLayout extends StatelessWidget {
  const WrapLayout({super.key});

  @override
  Widget build(BuildContext context) {
    //定义一个controller
    return const Center(
      child: Wrap(
        spacing: 8.0, // 主轴(水平)方向间距
        runSpacing: 4.0, // 纵轴（垂直）方向间距
        alignment: WrapAlignment.center, //沿主轴方向居中
        children: <Widget>[
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
            label: Text('Hamilton'),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
            label: Text('Lafayette'),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
            label: Text('Mulligan'),
          ),
          Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
            label: Text('Laurens'),
          ),
        ],
      ),
    );
  }
}

class FlowDelegateLayout extends FlowDelegate {
  EdgeInsets margin;

  FlowDelegateLayout({this.margin = EdgeInsets.zero});

  double width = 0;
  double height = 0;

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i)!.width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 指定Flow的大小，简单起见我们让宽度竟可能大，但高度指定为200，
    // 实际开发中我们需要根据子元素所占用的具体宽高来设置Flow大小
    return const Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

class StackPositioned extends StatelessWidget {
  const StackPositioned({super.key});

  @override
  Widget build(BuildContext context) {
    //定义一个controller
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
          fit: StackFit.expand, //未定位widget占满Stack整个空间
          children: <Widget>[
            Container(
              color: Colors.red,
              child: const Text("Hello world",style: TextStyle(color: Colors.white)),
            ),
            const Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            const Positioned(
              top: 18.0,
              child: Text("Your friend"),
            )
          ],
        ),
      ),
    );
  }
}

class AlignLayout extends StatelessWidget {
  const AlignLayout({super.key});

  @override
  Widget build(BuildContext context) {
    //定义一个controller
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Container(
            // height: 120.0,
            // width: 120.0,
            color: Colors.blue.shade50,
            child: const Align(
              //widthFactor和heightFactor是两个缩放因子，会分别乘以子元素的宽、高，最终的结果就是Align 组件的宽高
              //如果值为null，则组件的宽高将会占用尽可能多的空间
              //以下设置等同于height：120，width：120。  widthFactor/heightFactor * size = 120
              widthFactor: 2,
              heightFactor: 2,
              alignment: Alignment.topRight,

              //Alignment Widget会以矩形的中心点作为坐标原点，值从-1到1分别代表矩形左边到右边的距离和顶部到底边的距离
              //如Alignment(-1.0, -1.0) 代表矩形的左侧顶点，而Alignment(1.0, 1.0)代表右侧底部终点，而Alignment(1.0, -1.0) 则正是右侧顶点
              //Alignment可以通过其坐标转换公式将其坐标转为子元素的具体偏移坐标：(Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight/2+childHeight/2)
              // alignment: Alignment(1,0.0),

              //和 Alignment唯一的区别就是坐标原点不同！FractionalOffset 的坐标原点为矩形的左侧顶点
              //FractionalOffset的坐标转换公式为：实际偏移 = (FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)
              // alignment: FractionalOffset(0.2, 0.6),
              child: FlutterLogo(
                size: 60,
              ),
            ),
          )
      ),
    );
  }
}

class CenterLayout extends StatelessWidget {
  const CenterLayout({super.key});

  @override
  Widget build(BuildContext context) {
    //定义一个controller
    return const Center(
      child: Column(
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              child: Text("xxx"),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              widthFactor: 1,
              heightFactor: 1,
              child: Text("xxx"),
            ),
          )
        ],
      ),
    );
  }
}

class LayoutBuilderRoute extends StatelessWidget {
  const LayoutBuilderRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var children = List.filled(6, const Text("A"));
    // Column在本示例中在水平方向的最大宽度为屏幕的宽度
    return Column(
      children: [
        // 限制宽度为190，小于 200
        SizedBox(width: 190, child: ResponsiveColumn(children: children)),
        ResponsiveColumn(children: children),
        //打印布局时的约束信息
        const LayoutLogPrint(child:Text("xx"))
      ],
    );
  }
}

class ResponsiveColumn extends StatelessWidget {
  const ResponsiveColumn({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // 通过 LayoutBuilder 拿到父组件传递的约束，然后判断 maxWidth 是否小于200
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 200) {
          // 最大宽度小于200，显示单列
          return Column(mainAxisSize: MainAxisSize.min, children: children);
        } else {
          // 大于200，显示双列
          var children = <Widget>[];
          for (var i = 0; i < children.length; i += 2) {
            if (i + 1 < children.length) {
              children.add(Row(
                mainAxisSize: MainAxisSize.min,
                children: [children[i], children[i + 1]],
              ));
            } else {
              children.add(children[i]);
            }
          }
          return Column(mainAxisSize: MainAxisSize.min, children: children);
        }
      },
    );
  }
}

class LayoutLogPrint<T> extends StatelessWidget {
  const LayoutLogPrint({
    Key? key,
    this.tag,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final T? tag; //指定日志tag

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      // assert在编译release版本时会被去除
      assert(() {
        debugPrint('${tag ?? key ?? child}: $constraints');
        return true;
      }());
      return child;
    });
  }
}

//custom
class AfterLayoutRoute extends StatefulWidget {
  const AfterLayoutRoute({Key? key}) : super(key: key);

  @override
  State<AfterLayoutRoute> createState() => _AfterLayoutRouteState();
}

class _AfterLayoutRouteState extends State<AfterLayoutRoute> {
  String _text = 'flutter 实战 ';
  Size _size = Size.zero;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(
            builder: (context) {
              return GestureDetector(
                child: const Text(
                  'Text1: 点我获取我的大小',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue),
                ),
                onTap: () => debugPrint('Text1: ${context.size}'),
              );
            },
          ),
        ),
        AfterLayout(
          callback: (RenderAfterLayout ral) {
            debugPrint('Text2： ${ral.size}, ${ral.offset}');
          },
          child: const Text('Text2：flutter@wendux'),
        ),
        Builder(builder: (context) {
          return Container(
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            width: 100,
            height: 100,
            child: AfterLayout(
              callback: (RenderAfterLayout ral) {
                Offset offset = ral.localToGlobal(
                  Offset.zero,
                  ancestor: context.findRenderObject(),
                );
                debugPrint('A 在 Container 中占用的空间范围为：${offset & ral.size}');
              },
              child: const Text('A'),
            ),
          );
        }),
        const Divider(),
        AfterLayout(
          child: Text(_text),
          callback: (RenderAfterLayout value) {
            setState(() {
              //更新尺寸信息
              _size = value.size;
            });
          },
        ),
        //显示上面 Text 的尺寸
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Text size: $_size ',
            style: const TextStyle(color: Colors.blue),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _text += 'flutter 实战 ';
            });
          },
          child: const Text('追加字符串'),
        ),
      ],
    );
  }
}

class AfterLayout extends SingleChildRenderObjectWidget {
  const AfterLayout({
    Key? key,
    required this.callback,
    Widget? child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderAfterLayout(callback);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderAfterLayout renderObject) {
    renderObject.callback = callback;
  }
  /// [callback] will be triggered after the layout phase ends.
  final ValueSetter<RenderAfterLayout> callback;
}

class RenderAfterLayout extends RenderProxyBox {
  RenderAfterLayout(this.callback);

  ValueSetter<RenderAfterLayout> callback;

  @override
  void performLayout() {
    super.performLayout();
    // 不能直接回调callback，原因是当前组件布局完成后可能还有其它组件未完成布局
    // 如果callback中又触发了UI更新（比如调用了 setState）则会报错。因此，我们
    // 在 frame 结束的时候再去触发回调。
    // callback(this);
    SchedulerBinding.instance
        .addPostFrameCallback((timeStamp) => callback(this));

  }

  /// 组件在在屏幕坐标中的起始偏移坐标
  Offset get offset => localToGlobal(Offset.zero);
  /// 组件在屏幕上占有的矩形空间区域
  Rect get rect => offset & size;
}