import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyData {
  final int id;
  final String name;

  MyData(this.id, this.name);
}

// 定义一个异步的控制器类，继承自GetxController
class AsyncController extends GetxController {
  // 定义一个响应式的变量，用来存储异步获取的数据列表
  var items = <Future<MyData>>[].obs;
  // 定义一个变量，用来记录当前的页码
  var page = 1;
  // 定义一个变量，用来记录是否有更多的数据
  var hasMore = true;
  // 定义一个变量，用来记录是否正在加载数据
  var isLoading = false;

  final sc = ScrollController();
  @override
  void onInit() {
    sc.addListener(()=>onScroll(sc));
  }

  // 定义一个异步的方法，用来模拟从网络获取数据
  Future<List<Future<MyData>>> fetchData(int page) async {
    // 模拟延迟2秒
    await Future.delayed(const Duration(seconds: 3));

    List<Future<MyData>> dataList = [
      for(var i=0;i<10;i++)
        Future.value(MyData(i, 'Item ${page * 10 + i + 1}')),
    ];
    return dataList;
    // 模拟返回10个字符串数据，每个字符串包含页码和索引
    // return List.generate(10, (index) => 'Item ${page * 10 + index + 1}');
  }

  // 定义一个异步的方法，用来加载更多的数据
  Future<void> loadMore() async {
    debugPrint("loadMore");
    // 如果没有更多的数据或者正在加载数据，直接返回
    if (!hasMore || isLoading) {
      // debugPrint("loadMore not data found");
      return;
    }
    // 设置isLoading为true，表示开始加载数据
    isLoading = true;
    // 调用fetchData方法，并传入当前的页码
    final data = await fetchData(page);
    // 将返回的数据添加到items变量中
    items.addAll(data);
    // 设置isLoading为false，表示结束加载数据
    isLoading = false;
    // 判断是否还有更多的数据，如果返回的数据少于10个，说明没有更多的数据了
    hasMore = data.length == 10;
    // 如果还有更多的数据，将页码加一，准备下一次加载
    if (hasMore) {
      debugPrint("loadMore next page");
      page++;
    } else {
      debugPrint("loadMore not data found end");
    }
  }

  // 定义一个方法，用来刷新数据
  @override
  Future<void> refresh() async {
    debugPrint("refresh");
    // 设置页码为1，表示从第一页开始刷新
    page = 1;
    // 调用fetchData方法，并传入当前的页码
    final data = await fetchData(page);
    // 将items变量清空，然后添加返回的数据
    items.clear();
    items.addAll(data);
    // 判断是否还有更多的数据，如果返回的数据少于10个，说明没有更多的数据了
    hasMore = data.length == 10;
    // 如果还有更多的数据，将页码加一，准备下一次加载
    if (hasMore) {
      debugPrint("refresh next page");
      page++;
    } else {
      debugPrint("refresh not data found end");
    }
  }

  // 定义一个方法，用来监听滚动事件
  void onScroll(ScrollController scrollController) {
    // 获取滚动位置和最大滚动范围
    final position = scrollController.position;
    final maxScroll = position.maxScrollExtent;
    // 如果滚动位置接近最大滚动范围（差值小于200），调用loadMore方法加载更多数据
    if (maxScroll - position.pixels < 200) {
      debugPrint("onScroll loadMore");
      loadMore();
    }
  }
}

// 定义一个显示界面的类，继承自StatelessWidget
class AsyncView extends GetView<AsyncController> {
  AsyncView({super.key});
  var getData;  //缓存future，防止多次触发网络连接

  @override
  void onInit() {
    getData = controller.loadMore();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Async Example'),
      ),
      body: FutureBuilder<void>(
          future: getData, //使用变量来缓存函数结果，防止rebuild多次触发网络请求
          builder: (context, snapshot){
            if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Obx(() => RefreshIndicator(
                // 使用controller.refresh方法作为刷新回调函数
                  onRefresh: controller.refresh,
                  child: GridView.builder(
                    // 使用controller.onScroll方法作为滚动监听函数，并传入滚动控制器
                    controller: controller.sc,
                    // 使用controller.items.length作为列表长度
                    itemCount: controller.items.length,
                    itemBuilder: (context, index) {
                      final data = controller.items[index];
                      return FutureBuilder<MyData>(
                          future: data,
                          builder: (context, snapshot){
                            if (snapshot.hasError) {
                              return const Center(
                                child: Text('An error has occurred!'),
                              );
                            } else if (snapshot.hasData) {
                              return ListTile(
                                title: Text(snapshot.data!.name),
                              );
                            } else if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return const Text('nothing item data11');
                            }
                          }
                      );

                    },
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, //每行三列
                    ),
              )),
              );
            }
          }
      )
    );
  }
}

// 定义一个主函数，运行程序
void main() {
  // 使用Get.put()方法创建一个控制器对象，并调用loadMore方法加载第一页的数据
  Get.put(AsyncController());
  // 使用GetMaterialApp作为根组件，启用GetX功能
  runApp(GetMaterialApp(
    home: AsyncView(),
  ));
}
