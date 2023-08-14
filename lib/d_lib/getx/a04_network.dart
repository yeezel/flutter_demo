import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProvider extends GetConnect {
  String url = 'https://httpbin.org';
  @override
  void onReady(){
    debugPrint("ready");
  }
  @override
  void onInit() {
    debugPrint("init");
    // All request will pass to jsonEncode so CasesModel.fromJson()
    // httpClient.defaultDecoder = CasesModel.fromJson;

    httpClient.baseUrl = url;
    // 仅提供给socket
    // baseUrl = 'https://api.covid19api.com';

    // It's will attach 'apikey' property on header from all requests
    httpClient.addRequestModifier<void>((request) {
      request.headers['apikey'] = '12345678';
      return request;
    });


    httpClient.addResponseModifier<void>((request, response) {
      // CasesModel model = response.body;
      // if (model.countries.contains('Brazil')) {
      //   model.countries.remove('Brazilll');
      // }
      response.headers?['mykey'] = '1234859';
      return response;
    });


    // 设置代理
    httpClient.findProxy = (uri) {
      // 根据uri来判断是否需要代理
      debugPrint(uri.host);
      if (uri.host == 'httpbin.org') {
        // 返回代理字符串，格式为PROXY host:port;
        return 'PROXY 192.168.0.60:1099;';
      } else {
        // 返回DIRECT表示不需要代理
        return 'DIRECT';
      }
    };

    // httpClient.findProxy = HttpClient.findProxyFromEnvironment;

    // httpClient.addAuthenticator<void>((request) async {
    //   final response = await get("$url/token");
    //   final token = response.body['token'];
    //   // Set the header
    //   request.headers['Authorization'] = "$token";
    //   return request;
    // });

    //Autenticator will be called 3 times if HttpStatus is
    //HttpStatus.unauthorized
    httpClient.maxAuthRetries = 3;
  }
  //GET/POST/PUT/DELETE/SOCKET
  // Get request
  Future<Response> getUser(int id) => get('/get',query:{"a":"$id"});
  // Post request
  Future<Response> uploadUser(List<int> image) {
    final form = FormData({
      'file': MultipartFile(image, filename: 'avatar.png'),
      'otherFile': MultipartFile(image, filename: 'cover.png'),
    });
    return post('/post', form);
  }

  // GetSocket userMessages() {
  //   return socket('https://yourapi/users/socket');
  // }
}

void main() => runApp(GetMaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: Home()
));
class Home extends StatelessWidget {
  //添加组件
  UserProvider u = Get.put(UserProvider());
  Home({super.key});
  @override
  Widget build(context) {
    return Scaffold(
      // 使用obx方法监听状态字段count是否有变化
        appBar: AppBar(title:  const Text("network")),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(child: const Text("GET"), onPressed: () async {
                Response res = await u.getUser(1123);
                res.headers?.forEach((key, value) { debugPrint("$key=$value"); });
                debugPrint(res.body.toString());
              }),
              ElevatedButton(child: const Text("POST"), onPressed: () async {
                Response res = await u.uploadUser([12,3,4,5,6]);
                res.headers?.forEach((key, value) { debugPrint("$key=$value"); });
                debugPrint(res.body.toString());
              })
            ],
          ),
        ),
        floatingActionButton:
        FloatingActionButton(
            onPressed: () async {

            },
            child: const Icon(Icons.change_circle)
        )
    );
  }
}
