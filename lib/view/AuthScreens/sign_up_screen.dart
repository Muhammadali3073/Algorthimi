import 'dart:async';

import 'package:algorthimi/view/AuthScreens/login_screen.dart';
import 'package:algorthimi/view/AuthScreens/scan_id_freelancer_screen.dart';
import 'package:algorthimi/view/AuthScreens/scan_id_shop_owner_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var isSelectSignUp = 100.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: Container(
          width: 100.h,
          height: 100.h - 10.h,
          padding:
              EdgeInsets.only(top: 16.h, right: 3.h, left: 3.h, bottom: 10.h),
          decoration: BoxDecoration(
              color: accentColor,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(20.h))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: getSvgImage('app_logo.svg', height: 12.h)),
                  getVerSpace(1.h),
                  getCustomTextW6S22(text: 'SignUp', color: textWhiteColor),
                  getVerSpace(2.h),
                  getCustomTextW6S10(
                      text: 'Select Role', color: textWhiteColor),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      isSelectSignUp.value = 0;
                      Timer(const Duration(milliseconds: 100), () {
                        Get.to(() => const ScanIdFreelancerScreen());
                      });
                    },
                    child: outlineColorButton(
                        text: 'Freelancers',
                        color: isSelectSignUp.value == 0
                            ? pinkAppColor
                            : accentColor,
                        borderColor: isSelectSignUp.value == 0
                            ? pinkAppColor
                            : backgroundColor),
                  ),
                  getVerSpace(3.h),
                  GestureDetector(
                    onTap: () {
                      isSelectSignUp.value = 1;
                      Timer(const Duration(milliseconds: 100), () {
                        Get.to(() => const ScanIdShopOwnerScreen());
                      });
                    },
                    child: outlineColorButton(
                        text: 'Shop Owner',
                        color: isSelectSignUp.value == 1
                            ? pinkAppColor
                            : accentColor,
                        borderColor: isSelectSignUp.value == 1
                            ? pinkAppColor
                            : backgroundColor),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const LoginScreen());
                },
                child: RichText(
                  text: TextSpan(
                      text: 'Already have an account ?   '.tr,
                      style: getCustomTextStyleW5S15(
                        color: textWhiteColor,
                      ),
                      children: [
                        TextSpan(
                          text: 'Login'.tr,
                          style: getCustomTextStyleW7S15(
                            color: skyBlueTextColor,
                          ),
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
