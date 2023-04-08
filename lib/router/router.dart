import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/views/pilot/index.dart';
import '/views/test/index.dart';

/// 默认路由
String defaultRoute = '/';

/// 路由表
List<GetPage<dynamic>> routerList = [
  GetPage(name: '/', page: () => const ForceGuideDemo()),
  GetPage(name: '/test', page: () => TestPage()),
];

/// 路由守卫
void routerGuard(Routing? routing) {
  print('路由回调：${routing?.current}');
}