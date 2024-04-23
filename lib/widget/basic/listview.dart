import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      Demo1()..init(),
      Demo2()..init(),
      Demo3()..init(),
      Demo4()..init(),
      Demo5()..init(),
      Demo6()..init(),
    ]);
  }
}
class Demo1 extends Data{
  @override
  void init() {
    title="ListView / ExpansionTile / ListTile";
    code = '''
ListView(
  //该属性表示是否根据子组件的总长度来设置ListView的长度，默认值为false 。
  // 默认情况下，ListView会在滚动方向尽可能多的占用空间。当ListView在一个无边界(滚动方向上)的容器中时，shrinkWrap必须为true。
  shrinkWrap: true,
  padding: const EdgeInsets.all(20.0),
  //children参数适合只有少量的子组件数量已知且比较少的情况，否则应该使用ListView.builder 按需动态构建列表项
  children: const <Widget>[
    Text('I\'m dedicating every day to you'),
    Text('Domestic life was never quite my style'),
    Text('When you smile, you knock me out, I fall apart'),
    Text('And I thought I was so smart'),
    // 展开显示更多的内容，或者折叠起来隐藏内容， 通常与 ListView 一起使用
    ExpansionTile(
      title: Text('See More'),
      children: <Widget>[
        ListTile(title: Text('Item 1')),
        ListTile(title: Text('Item 2')),
        ListTile(title: Text('Item 3')),
      ],
    ),
  ],
)
''';
    ui = ListView(
      //该属性表示是否根据子组件的总长度来设置ListView的长度，默认值为false 。
      // 默认情况下，ListView会在滚动方向尽可能多的占用空间。当ListView在一个无边界(滚动方向上)的容器中时，shrinkWrap必须为true。
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      //children参数适合只有少量的子组件数量已知且比较少的情况，否则应该使用ListView.builder 按需动态构建列表项
      children: const <Widget>[
        Text('I\'m dedicating every day to you'),
        Text('Domestic life was never quite my style'),
        Text('When you smile, you knock me out, I fall apart'),
        Text('And I thought I was so smart'),
        ExpansionTile(
          title: Text('See More'),
          children: <Widget>[
            ListTile(title: Text('Item 1')),
            ListTile(title: Text('Item 2')),
            ListTile(title: Text('Item 3')),
          ],
        ),
      ],
    );
  }
}
class Demo2 extends Data{
  @override
  void init() {
    title="ListView.builder";
    code = '''
//ListView.builder适合列表项比较多或者列表项不确定的情况
ListView.builder(
    //列表项的数量，如果为null，则为无限列表。
    itemCount: 100,
    itemExtent: 50.0, //强制高度为50.0
    itemBuilder: (BuildContext context, int index) {
      return ListTile(title: Text("\$index"));
    }
)
''';
    ui = ListView.builder(
      //列表项的数量，如果为null，则为无限列表。
        itemCount: 100,
        itemExtent: 50.0, //强制高度为50.0
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("$index"));
        }
    );
  }
}

class Demo3 extends Data{
  @override
  void init() {
    title="ListTile";
    code = '''
//固定列表头
//ListView.builder适合列表项比较多或者列表项不确定的情况
const ListTile(title:Text("商品列表")),
Expanded(
  child: ListView.builder(itemBuilder: (BuildContext context, int index) {
    return ListTile(title: Text("\$index"));
  }),
),
''';
    ui = Column(children: <Widget>[
      const ListTile(title:Text("商品列表")),
      Expanded(
        child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text("$index"));
            }
        ),
      ),
    ]);
  }
}
class Demo4 extends Data{
  @override
  void init() {
    title="fixed item hight";
    code = '''
//当我们知道列表项的高度都相同时，强烈建议指定 itemExtent 或 prototypeItem
class FixedExtentList extends StatelessWidget {
  const FixedExtentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //如果我们知道列表中的所有列表项长度都相同但不知道具体是多少，这时我们可以指定一个列表项，
      // 该列表项被称为 prototypeItem（列表项原型）。
      // 指定 prototypeItem 后，可滚动组件会在 layout 时计算一次它延主轴方向的长度，
      // 这样也就预先知道了所有列表项的延主轴方向的长度，所以和指定 itemExtent 一样，指定 prototypeItem 会有更好的性能。
      // 注意，itemExtent 和prototypeItem 互斥，不能同时指定它们。
      prototypeItem: const ListTile(title: Text("1")),
      //比让子组件自己决定自身长度会有更好的性能，这是因为指定itemExtent后，滚动系统可以提前知道列表的长度，
      // 而无需每次构建子组件时都去再计算一下，尤其是在滚动位置频繁变化时（滚动系统需要频繁去计算列表高度）。
      // 知道实际高度则可使用itemExtent参数填写具体值
      //itemExtent: 48,
      itemBuilder: (context, index) {
        //LayoutLogPrint是一个自定义组件，在布局时可以打印当前上下文中父组件给子组件的约束信息
        return LayoutLogPrint(
          tag: index,
          child: ListTile(title: Text("\$index")),
        );
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
    ui = const FixedExtentList();
  }
}

class Demo5 extends Data{
  @override
  void init() {
    title="ListView.separated";
    code = '''
//ListView.builder适合列表项比较多或者列表项不确定的情况
//下划线widget预定义以供复用。
const Widget divider1=Divider(color: Colors.blue,);
const Widget divider2=Divider(color: Colors.green);

//可以在生成的列表项之间添加一个分割组件，separatorBuilder参数是一个分割组件生成器。
ListView.separated(
  itemCount: 100,
  //列表项构造器
  itemBuilder: (BuildContext context, int index) {
    return ListTile(title: Text("\$index"));
  },
  //分割器构造器
  separatorBuilder: (BuildContext context, int index) {
    return index%2==0?divider1:divider2;
  },
);
''';
    //下划线widget预定义以供复用。
    const Widget divider1=Divider(color: Colors.blue,);
    const Widget divider2=Divider(color: Colors.green);
    //可以在生成的列表项之间添加一个分割组件，separatorBuilder参数是一个分割组件生成器。
    ui = ListView.separated(
      itemCount: 100,
      //列表项构造器
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index%2==0?divider1:divider2;
      },
    );
  }
}
class Demo6 extends Data{
  @override
  void init() {
    title="Demo Infinite List";
    code = '''
class InfiniteListView extends StatefulWidget {
  const InfiniteListView({super.key});

  @override
  State<InfiniteListView> createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; //表尾标记
  final _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        //如果到了表尾
        if (_words[index] == loadingTag) {
          //不足100条，继续获取数据
          if (_words.length - 1 < 100) {
            //获取数据
            _retrieveData();
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(strokeWidth: 2.0),
              ),
            );
          } else {
            //已经加载了100条数据，不再获取数据。
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                "没有更多了",
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
        }
        //显示单词列表项
        return ListTile(title: Text(_words[index]));
      },
      separatorBuilder: (context, index) => const Divider(height: .0),
    );
  }

  void _retrieveData() {
    Future.delayed(const Duration(seconds: 2)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
        );
      });
    });
  }
}
''';
    ui = const InfiniteListView();
  }
}

//当我们知道列表项的高度都相同时，强烈建议指定 itemExtent 或 prototypeItem
class FixedExtentList extends StatelessWidget {
  const FixedExtentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //如果我们知道列表中的所有列表项长度都相同但不知道具体是多少，这时我们可以指定一个列表项，
      // 该列表项被称为 prototypeItem（列表项原型）。
      // 指定 prototypeItem 后，可滚动组件会在 layout 时计算一次它延主轴方向的长度，
      // 这样也就预先知道了所有列表项的延主轴方向的长度，所以和指定 itemExtent 一样，指定 prototypeItem 会有更好的性能。
      // 注意，itemExtent 和prototypeItem 互斥，不能同时指定它们。
      prototypeItem: const ListTile(title: Text("1")),
      //比让子组件自己决定自身长度会有更好的性能，这是因为指定itemExtent后，滚动系统可以提前知道列表的长度，
      // 而无需每次构建子组件时都去再计算一下，尤其是在滚动位置频繁变化时（滚动系统需要频繁去计算列表高度）。
      // 知道实际高度则可使用itemExtent参数填写具体值
      //itemExtent: 48,
      itemBuilder: (context, index) {
        //LayoutLogPrint是一个自定义组件，在布局时可以打印当前上下文中父组件给子组件的约束信息
        return LayoutLogPrint(
          tag: index,
          child: ListTile(title: Text("$index")),
        );
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

class InfiniteListView extends StatefulWidget {
  const InfiniteListView({super.key});

  @override
  State<InfiniteListView> createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; //表尾标记
  final _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        //如果到了表尾
        if (_words[index] == loadingTag) {
          //不足100条，继续获取数据
          if (_words.length - 1 < 100) {
            //获取数据
            _retrieveData();
            //加载时显示loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(strokeWidth: 2.0),
              ),
            );
          } else {
            //已经加载了100条数据，不再获取数据。
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                "没有更多了",
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
        }
        //显示单词列表项
        return ListTile(title: Text(_words[index]));
      },
      separatorBuilder: (context, index) => const Divider(height: .0),
    );
  }

  void _retrieveData() {
    Future.delayed(const Duration(seconds: 2)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
        );
      });
    });
  }
}