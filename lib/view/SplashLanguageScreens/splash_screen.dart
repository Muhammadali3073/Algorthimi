// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';
import 'language_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _getIsFirst();
  }

  _getIsFirst() async {
    // bool isIntro = await PrefData.getIsIntro();
    // bool isSignIn = await PrefData.getIsSignIn();
    //
    // if (isIntro) {
    //   Constant.sendToNext(context, Routes.introScreenRoute);
    // } else if (!isSignIn) {
    //   Constant.sendToNext(context, Routes.loginScreenRoute);
    // } else {
    //   Timer(const Duration(seconds: 3), () {
    //     Constant.sendToNext(context, Routes.homeScreenRoute);
    //   });
    // }
    Timer(const Duration(seconds: 3), () {
      Get.offAll(()=> const LanguageScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.h,
        color: accentColor,
        child: Center(
            child: getSvgImage('splash.svg', width: 26.2.h, height: 19.7.h)),
      ),
    );
  }
}
