import 'package:flutter/material.dart';
import 'package:flutter_demo1/utils/rpx.dart';
import 'package:get/get.dart';
import 'package:bruno/bruno.dart';

class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);
  var count = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.vw,
      height: 100.vh,
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: Obx(
                () => Text(
                  '数值：$count',
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
              ),
              onTap: () {
                Get.back();
              },
            ),
            SizedBox(
              height: 100.rpx,
            ),
            SizedBox(
              width: 300.rpx,
              child: BrnButtonPanel(
                mainButtonName: '+1',
                mainButtonOnTap: () {
                  count.value++;
                  print('mainButtonOnTap');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
