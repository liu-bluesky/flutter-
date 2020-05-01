// 谷歌推出的
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:weixin/pages/index.dart';
import 'package:weixin/provide/configPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './routers/routers.dart';

void main(List<String> args) {
  var providers = Providers();
  var counter = ConfigPageProvide();
  providers
   ..provide(Provider<ConfigPageProvide>.value(counter));
    runApp(ProviderNode(
    providers: providers,
    child: MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    return MaterialApp(
      title: '微信',
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
      home: IndexPage(),
      theme: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent
      ),
    );
  }
}