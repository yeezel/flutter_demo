import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:flutter_demo/c_function/f2_ffigen_autocreate.dart';


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

1. 添加依赖库：ffigen: ^7.2.9
2. 引入动态库
flutter:
  assets:
    - static/lib/demo.dll
3. 添加C头文件：f2_ffigen_demo.h
4. 安装LLVM：https://github.com/llvm/llvm-project/releases
4. 配置pubspec.yaml
ffigen:
  name: NativeLibrary
  description: Bindings to `lib/c_function/f2_ff1_demo.h`.
  output: 'lib/c_function/f2_ffigen_autocreate.dart'
  headers:
    entry-points:
      - 'lib/c_function/f2_ffigen_demo.h'
  llvm-path:
    - 'D:\LLVM'
5. 生成代码：dart run ffigen（项目根目录运行）
6. 测试（本类）
 */

void main() {
  // 初始化Dart FFI库
  DynamicLibrary myLib = DynamicLibrary.open('static/lib/demo.dll');

  //4.调用
  const configStr = 'your v2ray config string';
  final configStrPtr = configStr.toNativeUtf8().cast<Char>();
  final resultPtr = NativeLibrary(myLib).flutterV2rayChar(configStrPtr).cast<Utf8>();
  final result = resultPtr.toDartString();
  print("return : $result");
}