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
            child: const Text("证书校验"),
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
      var url = "https://httpbin.org/ip";
      Uri uri = Uri.parse(url);
      String pem = "static/httpbin.org.crt"; //可以从文件读取

      //通过setTrustedCertificates()设置的证书格式必须为 PEM 或 PKCS12，
      //如果证书格式为PKCS12，则需将证书密码传入，这样则会在代码中暴露证书密码，
      // 所以客户端证书校验不建议使用 PKCS12 格式的证书。
      SecurityContext sc = SecurityContext();
      //file为证书路径
      sc.setTrustedCertificates(pem);
      //创建一个HttpClient
      HttpClient httpClient = HttpClient(context: sc);

      httpClient.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
        if (cert.pem == pem) {
          //校验host，host 验证通常是为了防止证书和域名不匹配
          return true; //证书一致，则允许发送数据
        }
        return false;
      };

      //打开Http连接
      HttpClientRequest request = await httpClient.getUrl(uri);
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
