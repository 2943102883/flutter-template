import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class Adapt {
//   static MediaQueryData _mediaQueryData = const MediaQueryData();
//   static double screenWidth = 0;
//   static double screenHeight = 0;
//   static double rpx = 0;
//   static double px = 0;
//
//   static void initialize(BuildContext context, {double standardWidth = designFullWidth}) {
//     _mediaQueryData = MediaQuery.of(context);
//     screenWidth = _mediaQueryData.size.width;
//     screenHeight = _mediaQueryData.size.height;
//     rpx = screenWidth / standardWidth;
//     px = screenWidth / standardWidth * 2;
//   }
//
//   // 按照像素来设置
//   static double setPx(double size) {
//     return Adapt.rpx * size * 2;
//   }
//
//   // 按照rxp来设置
//   static double setRpx(double size) {
//     return Adapt.rpx * size;
//   }
// }

int designFullWidth = 750;  // 设计稿满屏宽度

extension StringExtension on String {
  double get rpx {
    // 获取字符串前面的数字部分（支持小数）
    final match = RegExp(r'^(\d+(?:\.\d+)?)').firstMatch(this);
    final value = double.parse(match?.group(1) ?? '0');
    // 处理获取rpx，这里假设设计稿宽度为 designFullWidth
    return value / designFullWidth * MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;
  }
  double get px {
    // 获取字符串前面的数字部分（支持小数）
    final match = RegExp(r'^(\d+(?:\.\d+)?)').firstMatch(this);
    final value = double.parse(match?.group(1) ?? '0');
    // 处理获取px，这里假设设计稿宽度为 designFullWidth
    return value / designFullWidth * MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width * 2;
  }
  double get vw {
    // 获取字符串前面的数字部分（支持小数）
    final match = RegExp(r'^(\d+(?:\.\d+)?)').firstMatch(this);
    final value = double.parse(match?.group(1) ?? '0');
    // 处理获取vw
    return value / 100 * MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;
  }
  double get vh {
    // 获取字符串前面的数字部分（支持小数）
    final match = RegExp(r'^(\d+(?:\.\d+)?)').firstMatch(this);
    final value = double.parse(match?.group(1) ?? '0');
    // 处理获取vh
    return value / 100 * MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height;
  }
}

extension IntExtension on int {
  double get rpx {
    // 处理获取rpx，这里假设设计稿宽度为 designFullWidth
    return this / designFullWidth * MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;
  }
  double get px {
    // 处理获取px，这里假设设计稿宽度为 designFullWidth
    return this / designFullWidth * MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width * 2;
  }
  double get vw {
    // 处理获取vw
    return this / 100 * MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;
  }
  double get vh {
    // 处理获取vh
    return this / 100 * MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height;
  }
}

extension DoubleExtension on double {
  double get rpx {
    // 处理获取rpx，这里假设设计稿宽度为 designFullWidth
    return this / designFullWidth * MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;
  }
  double get px {
    // 处理获取px，这里假设设计稿宽度为 designFullWidth
    return this / designFullWidth * MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width * 2;
  }
  double get vw {
    // 处理获取vw
    return this / 100 * MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;
  }
  double get vh {
    // 处理获取vh
    return this / 100 * MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height;
  }
}

class AdaptSize {
  /// 满屏宽度
  static double fullWidth = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.width;

  /// 满屏高度
  static double fullHeight = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).size.height;

  /// 状态栏高度
  static double statusBarHeight = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).padding.top;

  /// 底部安全区距离
  static double bottomSafeHeight = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).padding.bottom;

  /// 顶部安全区距离
  static double topSafeHeight = MediaQueryData.fromWindow(WidgetsBinding.instance!.window).padding.top;
}

// 用法
// '100'.rpx
// '100'.px
// 100.rpx
// 100.px
// 10.1.rpx
// 10.1.px
// AdaptSize.fullWidth