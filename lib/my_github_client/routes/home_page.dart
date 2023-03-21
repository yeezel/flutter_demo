import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/Git.dart';
import '../i10n/GmLocalizations.dart';
import '../models/repo.dart';
import '../states/UserModel.dart';
import '../widgets/MyDrawer.dart';
import 'RepoItem.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key});

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  static const loadingTag = "##loading##"; //表尾标记
  final _items = <Repo>[Repo()..name = loadingTag];
  bool hasMore = true; //是否还有数据
  int page = 1; //当前请求的是第几页
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GmLocalizations.of(context).home),
      ),
      body: _buildBody(), // 构建主页面
      drawer: const MyDrawer(), //抽屉菜单
    );
  }
  Widget _buildBody() {
    UserModel userModel = Provider.of<UserModel>(context);
    if (!userModel.isLogin) {
      //用户未登录，显示登录按钮
      return Center(
        child: ElevatedButton(
          child: Text(GmLocalizations.of(context).login),
          onPressed: () => Navigator.of(context).pushNamed("login"),
        ),
      );
    } else {
      //已登录，则显示项目列表
      return ListView.separated(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          //如果到了表尾
          if (_items[index].name == loadingTag) {
            //不足100条，继续获取数据
            if (hasMore) {
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
          return RepoItem(_items[index]);
        },
        separatorBuilder: (context, index) => const Divider(height: .0),
      );
    }
  }

  //请求数据
  void _retrieveData() async {
    var data = await Git(context).getRepos(
      queryParameters: {
        'page': page,
        'page_size': 20,
      },
    );
    //如果返回的数据小于指定的条数，则表示没有更多数据，反之则否
    hasMore = data.isNotEmpty && data.length % 20 == 0;
    //把请求到的新数据添加到items中
    setState(() {
      _items.insertAll(_items.length - 1, data);
      page++;
    });
  }
}