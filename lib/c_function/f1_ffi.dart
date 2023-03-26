import 'dart:ffi' as ffi;
import 'dart:io' show Platform;
import 'package:ffi/ffi.dart';


/*

//main.go代码
package main

import "C"
import "fmt"

// #需要export声明是将该函数暴露给出去，并且需要转为C函数
//export flutterV2rayChar
func flutterV2rayChar(configStr *C.char) *C.char {
    config := C.GoString(configStr)
	fmt.Println(config)
	//Go的字符串转换为C语言字符串
    result := "ok start v2ray"
    return C.CString(result)
}

func main(){}

前提：构建好动态库，需要添加ffi:^2.0.1包
步骤：
1.引入动态库
flutter:
  assets:
    - static/lib/demo.dll

2. 调用动态函数

 */

// final ffi.DynamicLibrary nativeLibrary = Platform.isAndroid
//     ? ffi.DynamicLibrary.open('static/lib/demo.so')
//     : ffi.DynamicLibrary.process();

//1.声明动态库函数
typedef GolanFlutterV2rayFunc = ffi.Pointer<Utf8> Function(ffi.Pointer<Utf8>);
typedef DartFlutterV2rayFunc = ffi.Pointer<Utf8> Function(ffi.Pointer<Utf8>);

void main() {
  //2. 加载动态库
  final ffi.DynamicLibrary nativeLibrary = ffi.DynamicLibrary.open('static/lib/demo.dll');

  //3. 获取动态库函数通道
  final DartFlutterV2rayFunc flutterV2ray =
  nativeLibrary.lookupFunction<GolanFlutterV2rayFunc,DartFlutterV2rayFunc>('flutterV2rayChar');

  //4.调用
  const configStr = 'your v2ray config string';
  final configStrPtr = configStr.toNativeUtf8();
  final resultPtr = flutterV2ray(configStrPtr);
  final result = resultPtr.toDartString();
  print("return : $result");
}