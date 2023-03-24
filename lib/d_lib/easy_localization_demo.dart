import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

//https://pub.dev/packages/easy_localization
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('ar', 'DZ'),
      Locale('de', 'DE'),
      Locale('ru', 'RU')
    ],
    path: 'static/l10n/easy_localization',
    child: const MyApp(),
    // fallbackLocale: Locale('en', 'US'),
    // startLocale: Locale('de', 'DE'),
    // saveLocale: false,
    // useOnlyLangCode: true,

    // optional assetLoader default used is RootBundleAssetLoader which uses flutter's assetloader
    // install easy_localization_loader for enable custom loaders
    // assetLoader: RootBundleAssetLoader()
    // assetLoader: HttpAssetLoader()
    // assetLoader: FileAssetLoader()
    // assetLoader: CsvAssetLoader()
    // assetLoader: YamlAssetLoader() //multiple files
    // assetLoader: YamlSingleAssetLoader() //single file
    // assetLoader: XmlAssetLoader() //multiple files
    // assetLoader: XmlSingleAssetLoader() //single file
    // assetLoader: CodegenLoader()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('example.helloWorld'.tr());
    var _gender = true;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // args
              const Text('msg').tr(args: ['Easy localization', 'Dart']),

              // namedArgs
              const Text('msg_named').tr(namedArgs: {'lang': 'Dart'}),

              // args and namedArgs
              const Text('msg_mixed')
                  .tr(args: ['Easy localization'], namedArgs: {'lang': 'Dart'}),

              // gender
              const Text('gender').tr(gender: _gender ? "female" : "male"),

              // gender
              const Text('example.helloWorld').tr(),
            ],
          ),
        ),
      ),
    );
  }
}
