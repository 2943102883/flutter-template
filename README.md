# Flutter_Template

一个flutter模版

[![English](https://img.shields.io/badge/Language-English-blueviolet?style=for-the-badge)](README.es.md)[![Chinese](https://img.shields.io/badge/Language-Chinese-blueviolet?style=for-the-badge)](README.md)
## 1、开始

### 1.1、安装

```bash
flutter pub get
```

### 1.2、运行

```bash
flutter run
```

## 2、目录结构

```bash
lib
├── config.dart                 # 配置文件
├── main.dart                   # 入口文件
├── router                      # 路由
│   └── router.dart             # 路由配置
├── service                     # 服务
│   └── login.dart              # 登录服务
├── test.dart                   # 测试文件
└── utils                       # 工具类
		├── curl.dart            		# curl生成工具
    ├── request.dart            # 网络请求
    └── rpx.dart                # 单位适配工具


```

## 3、集成
| 名称     | 功能                             |
|--------|--------------------------------|
| Bruno  | 开箱即用的Flutter组件库                |
| Getx   | 集成了状态管理、路由管理等功能                |
| Dio    | 使用单例模式封装了网络请求                  |
| curl生成 | 编写了`curl`生成插件                  |
| 单位     | 编写了适配前端开发：`rpx`、`px`、`vw`、`vh` |
| 时间     | 类Moment.js插件 `moment_dart`     |
| 缓存     | 多端适配缓存插件`shared_preferences`   |