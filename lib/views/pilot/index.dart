import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bruno/bruno.dart';
import 'package:flutter_demo1/config.dart';
import 'package:flutter_demo1/utils/request.dart';
import 'package:flutter_demo1/utils/rpx.dart';
import 'package:get/get.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../service/login.dart';

class ForceGuideDemo extends StatefulWidget {
  const ForceGuideDemo({Key? key}) : super(key: key);

  @override
  _ForceGuideDemoState createState() => _ForceGuideDemoState();
}

class _ForceGuideDemoState extends State<ForceGuideDemo> {
  BrnGuide? intro;

  _ForceGuideDemoState() {
    /// init Guide
    intro = BrnGuide(
      stepCount: 6,
      introMode: GuideMode.force,

      /// use defaultTheme, or you can implement widgetBuilder function yourself
      widgetBuilder: StepWidgetBuilder.useDefaultTheme(
        showClose: false,
        tipInfo: [
          BrnTipInfoBean("标题栏", "这里使用的是Bruno组件库的Bar", ""),
          BrnTipInfoBean("标签组件", "这里是标签组件，你可以动态添加或者删除组件，当你点击后会将结果给你回传", ""),
          BrnTipInfoBean("网络请求", "封装了网络请求，并且可以生成CURL", ''),
          BrnTipInfoBean("路由", "使用get的路由，方便使用", ''),
          BrnTipInfoBean("单位换算 ", "适配rpx、px、vh、vw单位", ''),
          BrnTipInfoBean("图表 ", "这是一个图表示例", ""),
        ],
      ),
    );
  }

  List<String> nameList = [
    '这是一条很长很长很长很长很长很长很长很长很长很长的标签',
    '标签么么么么么',
    '标签么么没没没么么么',
    '标签么么么么么',
    '标签么么么么么'
  ];

  @override
  void initState() {
    super.initState();
    Timer(const Duration(microseconds: 0), () {
      intro?.start(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: BrnAppBar(
          automaticallyImplyLeading: false,
          brightness: Brightness.light,
          title: Text(
            'Flutter基础模版',
            key: intro?.keys[0],
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'BrnSelectTagWidget',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Text(
                  '流式布局的自适应标签(最小宽度75)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                BrnSelectTag(
                  key: intro!.keys[1],
                  tagWidth: (MediaQuery.of(context).size.width - 40 - 24) / 3,
                  fixWidthMode: false,
                  onSelect: (index) {
                    BrnToast.show("$index is selected", context);
                  },
                  tags: nameList,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    BrnButtonPanel(
                      key: intro!.keys[2],
                      mainButtonName: '网络请求测试',
                      mainButtonOnTap: () {
                        // LoginService.getUser().then((value) {
                        //   BrnToast.show(value.toString(), context);
                        // });


                        LoginService().getUser().then((value) {
                          BrnToast.show(value['result'].toString(), context);
                        });
                        // BrnToast.show("网络请求测试", context,
                        //     duration: BrnDuration.short);
                      },
                    ),
                    BrnBigGhostButton(
                      key: intro!.keys[3],
                      title: '路由跳转',
                      width: 200.rpx,
                      onTap: () {
                        Get.toNamed('/test');
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      key: intro!.keys[4],
                      width: 500.rpx,
                      height: 200.rpx,
                      color: Colors.lightBlue,
                      child: const Center(
                          child: Text(
                            '500rpx * 200rpx',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  key: intro?.keys[5],
                  child: const chartLineTest(),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          /// 1st guide
          child: const Icon(
            Icons.play_arrow,
          ),
          onPressed: () {
            intro!.start(context);
          },
        ),
      ),
      onWillPop: () async {
        // destroy guide page when tap back key
        intro!.dispose();
        return true;
      },
    );
  }
}

class chartLineTest extends StatefulWidget {
  const chartLineTest({Key? key}) : super(key: key);

  @override
  State<chartLineTest> createState() => _chartLineTestState();
}

class _chartLineTestState extends State<chartLineTest> {
  @override
  Widget build(BuildContext context) {
    return BrnProgressBarChart(
      barChartStyle: BarChartStyle.vertical,
      xAxis: ChartAxis(axisItemList: [
        AxisItem(showText: '示例1'),
        AxisItem(showText: '示例2'),
        AxisItem(showText: '示例3'),
        AxisItem(showText: '示例4'),
        AxisItem(showText: '示例5'),
        AxisItem(showText: '示例6'),
        AxisItem(showText: '示例7'),
        AxisItem(showText: '示例8'),
        AxisItem(showText: '示例9'),
        AxisItem(showText: '示例10'),
      ]),
      barBundleList: [
        BrnProgressBarBundle(barList: [
          BrnProgressBarItem(
            text: '示例11',
            value: 5,
            hintValue: 15,
          ),
          BrnProgressBarItem(
              text: '示例12', value: 20, selectedHintText: '示例12:20'),
          BrnProgressBarItem(
              text: '示例13',
              value: 30,
              selectedHintText:
              '示例13:30\n示例13:30\n示例13:30\n示例13:30\n示例13:30\n示例13:30'),
          BrnProgressBarItem(text: '示例14', value: 25),
          BrnProgressBarItem(text: '示例15', value: 21),
          BrnProgressBarItem(text: '示例16', value: 28),
          BrnProgressBarItem(text: '示例17', value: 15),
          BrnProgressBarItem(text: '示例18', value: 11),
          BrnProgressBarItem(text: '示例19', value: 30),
          BrnProgressBarItem(text: '示例110', value: 24),
        ], colors: [
          Color(0xff1545FD),
          Color(0xff0984F9)
        ]),
        BrnProgressBarBundle(barList: [
          BrnProgressBarItem(text: '示例21', value: 20, hintValue: 15),
          BrnProgressBarItem(
              text: '示例22', value: 15, selectedHintText: '示例12:20'),
          BrnProgressBarItem(
              text: '示例23',
              value: 30,
              selectedHintText:
              '示例13:30\n示例13:30\n示例13:30\n示例13:30\n示例13:30\n示例13:30'),
          BrnProgressBarItem(text: '示例24', value: 20),
          BrnProgressBarItem(text: '示例25', value: 28),
          BrnProgressBarItem(text: '示例26', value: 25),
          BrnProgressBarItem(text: '示例27', value: 17),
          BrnProgressBarItem(text: '示例28', value: 14),
          BrnProgressBarItem(text: '示例29', value: 36),
          BrnProgressBarItem(text: '示例210', value: 29),
        ], colors: [
          Color(0xff01D57D),
          Color(0xff01D57D)
        ]),
      ],
      yAxis: ChartAxis(axisItemList: [
        AxisItem(showText: '10'),
        AxisItem(showText: '20'),
        AxisItem(showText: '30')
      ]),
      singleBarWidth: 30,
      barGroupSpace: 30,
      barMaxValue: 60,
      onBarItemClickInterceptor:
          (barBundleIndex, barBundle, barGroupIndex, barItem) {
        return true;
      },
    );
  }
}
