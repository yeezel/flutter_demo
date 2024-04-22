import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
    //添加国际化
    translations: Messages(),
    //读取系统语言
    //locale: Get.deviceLocale,
    locale: const Locale('en', 'US'),
    //备用语言，当locale无法匹配时，会匹配该语言
    fallbackLocale: const Locale('en', 'UK'),
    //------------
    home: const Home()
));
class Home extends StatelessWidget {
  const Home({super.key});


  @override
  Widget build(context) {

    return Scaffold(
        // 使用obx方法监听状态字段count是否有变化
        appBar: AppBar(title:  Text("i18n".tr)),
        body: Center(
            child: Column(
              children: [
                Text('hello'.tr),
                //占位符
                Text('logged_in'.trParams({
                  'name': 'Jhon',
                  'email': 'jhon@example.com'
                }))
              ],
            )
        ),
        floatingActionButton:
        FloatingActionButton(
            onPressed: (){
              if(Get.locale?.countryCode=="US"){
                Get.updateLocale(const Locale('zh', 'CN')); //改变语言
              } else {
                Get.updateLocale(const Locale('en', 'US'));
              }
              debugPrint("系统语言：${Get.deviceLocale}");
            },
            child: const Icon(Icons.change_circle)
        )
    );
  }
}
class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': 'Hello World',
      'i18n': 'internationalization',
      'logged_in': 'logged in as @name with email @email',
    },
    'zh_CN': {
      'hello': '你好世界',
      'i18n': '国际化',
      'logged_in': '登录用户名 @name 和邮箱 @email',
    }
  };
}