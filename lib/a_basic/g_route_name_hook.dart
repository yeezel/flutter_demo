import 'package:flutter/material.dart';
//命名路由
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/", //名为"/"的路由作为应用的home(首页)
      //注册路由
      routes: {
        "/": (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        //带构造参数的时候
        "/next": (context) => NewRoute(title: ModalRoute.of(context)!.settings.arguments as String)
      },
      //hook钩子，路由未注册到路由表的时候，会调用 onGenerateRoute 来生成路由组件
      onGenerateRoute:(RouteSettings settings){
        return MaterialPageRoute(
            builder: (context) {
              String? routeName = settings.name;
              // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
              // 引导用户登录；其他情况则正常打开路由。
              return const MyHomePage(title: 'Flutter Demo Home Page');
            }
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("route one"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: const Text("open new route"),
              onPressed: () async {
                //导航到新路由，无参
                // Navigator.pushNamed(context, "/next");
                //导航到新路由，有参
                // Navigator.of(context).pushNamed("/next",arguments:"bb");
                var result = await Navigator.pushNamed(context, "/next",arguments:"bb");
                debugPrint(result.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
class NewRoute extends StatelessWidget {
  const NewRoute({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    //获取路由参数
    String args=ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text("提示"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(title),
              Text(args),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: const Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}