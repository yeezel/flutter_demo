import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HttpTestRoute(),
    );
  }
}

class HttpTestRoute extends StatefulWidget {
  const HttpTestRoute({super.key});

  @override
  State<HttpTestRoute> createState() => _HttpTestRouteState();
}

class _HttpTestRouteState extends State<HttpTestRoute> {
  bool _loading = false;
  String _text = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text(_text.replaceAll(RegExp(r"\s"), "")),
          ),
          ElevatedButton(
            onPressed: _loading ? null : request,
            child: const Text("登录认证"),
          ),
        ],
      ),
    );
  }

  void request() async {
    setState(() {
      _loading = true;
      _text = "正在请求...";
    });
    try {
      var url = "https://httpbin.org/basic-auth/aa/bb";
      Uri uri = Uri.parse(url);
      //创建一个HttpClient
      HttpClient httpClient = HttpClient();

      //全局添加凭证
      //如果所有请求都需要认证，应该在HttpClient初始化时就调用addCredentials()来添加全局凭证
      httpClient.addCredentials(
        uri,
       "admin11",
       //Basic认证凭据
       HttpClientBasicCredentials("aa","bb"),
       //Digest认证凭据
       // HttpClientDigestCredentials("aa","bb")
      );

      //动态添加凭证
      //当服务器需要用户凭据且该用户凭据未被添加时，httpClient会调用此回调，在这个回调当中，一般会调用addCredential()来动态添加用户凭证
      //httpClient.authenticate=(Uri url, String scheme, String realm) async{
      //  if(url.host=="xx.com" && realm=="admin"){
      //    httpClient.addCredentials(url,
      //      "admin",
      //      //Basic认证凭据
      //      HttpClientBasicCredentials("username","pwd"),
      //      //Digest认证凭据
      //      HttpClientDigestCredentials("username","password")
      //    );
      //    return true;
      //  }
      //  return false;
      //};

      //打开Http连接
      HttpClientRequest request =
      await httpClient.getUrl(uri);
      //HttpClient设置的头对所有请求生效
      //HttpClientRequest设置的头只对当前请求生效
      //使用iPhone的UA
      request.headers.add(
        "user-agent",
        "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1",
      );
      //等待连接服务器（会将请求信息发送给服务器）
      HttpClientResponse response = await request.close();
      //读取响应内容
      _text = await response.transform(utf8.decoder).join();
      //输出响应头
      debugPrint(response.statusCode.toString());
      debugPrint(response.headers.toString());
      debugPrint(_text);

      //关闭client后，通过该client发起的所有请求都会中止。
      httpClient.close();
    } catch (e) {
      _text = "请求失败：$e";
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }
}