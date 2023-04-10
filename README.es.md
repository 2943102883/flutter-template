# Flutter_Template

A Flutter Template


[![English](https://img.shields.io/badge/Language-English-blueviolet?style=for-the-badge)](README.es.md)[![Chinese](https://img.shields.io/badge/Language-Chinese-blueviolet?style=for-the-badge)](README.md)
## 1、Start

### 1.1、Install

```bash
flutter pub get
```

### 1.2、Run

```bash
flutter run
```

## 2、Directory structure

```bash
lib
├── config.dart                 # configuration file
├── main.dart                   # Entry file
├── router                      # route
│   └── router.dart             # Routing Configuration
├── service                     # service
│   └── login.dart              # Login Service
├── test.dart                   # Test files
└── utils                       # Tools
	├── curl.dart            		# Curl generation tool
    ├── request.dart            # Network Request
    └── rpx.dart                # Unit adaptation tool


```

## 3、Integrated
| Name           | Function                                                             |
|----------------|----------------------------------------------------------------------|
| Bruno          | Out of the box Flutter component library                             |
| Getx           | Integrated functions such as state management and routing management |
| Dio            | Encapsulates the network request using the singleton pattern         |
| curl generator | A `curl` generation plugin                                           |
| unit           | Adapt to front-end development：`rpx`、`px`、`vw`、`vh`                  |
| time           | Similar to Moment.js `moment_dart`                                   |
| cache          | Multi end adaptive caching plugin`shared_preferences`                |
| quick update   | `flutter_xupdate`                                                    |