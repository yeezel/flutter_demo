import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const GetMaterialApp(home: Home()));
class Controller extends GetxController{
  var count = 0.obs;
  increment() => count++;

  var selectedIndex = 0.obs;
  onItemTapped(index) => selectedIndex.value = index;
}
class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(context) {

    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());

    return Scaffold(
      // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Center(child: ElevatedButton(
            child: const Text("Go to Other"), onPressed: () => Get.to(Other()))),
        floatingActionButton:
        FloatingActionButton(onPressed: c.increment, child: const Icon(Icons.add)),

        bottomNavigationBar: Obx(() {
          return BottomNavigationBar( // 底部导航
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Hocon: Texme'),
              BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
            ],
            currentIndex: c.count.value,
            fixedColor: Colors.blue,
            onTap: c.onItemTapped,
          );
        })
    );
  }
}

class Other extends StatelessWidget {
  // You can ask Get to find a Controller that is being used by another page and redirect you to it.
  final Controller c = Get.find();

  Other({super.key});

  @override
  Widget build(context){
    // Access the updated count variable
    return Scaffold(
        appBar: AppBar(title: const Text("返回")),
        body: Center(
          child: Text("${c.count}")
        )
    );
  }
}