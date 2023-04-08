import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '/router/router.dart';

// 程序入口
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: defaultRoute,
      getPages: routerList,
      routingCallback: routerGuard,
    );
  }
}