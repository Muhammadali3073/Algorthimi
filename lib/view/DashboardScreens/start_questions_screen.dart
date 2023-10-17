import 'dart:async';
import 'dart:developer';
import 'package:algorthimi/view/DashboardScreens/questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';

class StartQuestionsScreen extends StatefulWidget {
  StartQuestionsScreen({Key? key, this.userType}) : super(key: key);
  dynamic userType;

  @override
  State<StartQuestionsScreen> createState() => _StartQuestionsScreenState();
}

class _StartQuestionsScreenState extends State<StartQuestionsScreen> {
  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 60 * 60;
  var currentSeconds = 0.obs;
  Timer? surveyTimer;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds.value) ~/ 60).toString().padLeft(2, '0')} : ${((timerMaxSeconds - currentSeconds.value) % 60).toString().padLeft(2, '0')}';

  startTimeout() {
    var duration = interval;
    surveyTimer = Timer.periodic(duration, (timer) {
      log(timer.tick.toString());
      currentSeconds.value = timer.tick;
      if (timer.tick >= timerMaxSeconds) timer.cancel();
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  void dispose() {
    surveyTimer!.cancel();
    super.dispose();
  }

  back() {
    Get.back();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: WillPopScope(
          onWillPop: () {
            return back();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100.h,
                height: 80.h,
                padding: EdgeInsets.only(
                    top: 16.h, right: 3.h, left: 3.h, bottom: 10.h),
                decoration: BoxDecoration(
                    color: accentColor,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(20.h))),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      getCustomTextW6S20(
                          text: 'Let’s Start...', color: textWhiteColor),
                      Column(
                        children: [
                          getCustomTextW6S17(
                              text: 'Quick Supermarket, Majan',
                              color: textWhiteColor),
                          getVerSpace(2.h),
                          getCustomTextW6S17(
                              text: 'Your slot has been blocked for\n60 min',
                              color: textWhiteColor,
                              textAlign: TextAlign.center),
                        ],
                      ),
                      timerButton(
                        text: timerText,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 4.h, left: 3.h, right: 3.h),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => QuestionsScreen(
                          userType: widget.userType,
                        ));
                  },
                  child: fillColorButton(
                      text: 'Start Survey Now!', color: pinkAppColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
