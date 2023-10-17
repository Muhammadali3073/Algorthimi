import 'package:algorthimi/view/BottomNavBar/bottom_nav_bar_freelancer_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';

class AlAnsariExchangeScreen extends StatefulWidget {
  const AlAnsariExchangeScreen({Key? key}) : super(key: key);

  @override
  State<AlAnsariExchangeScreen> createState() => _AlAnsariExchangeScreenState();
}

class _AlAnsariExchangeScreenState extends State<AlAnsariExchangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SizedBox(
        height: 100.h,
        width: 100.h,
        child: Stack(
          children: [
            Container(
              height: 20.h,
              width: 100.w,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 6.h, left: 3.h, right: 3.h),
              decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(4.h))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back_ios_new_outlined,
                        color: backgroundColor, size: 2.5.h),
                  ),
                  const Spacer(),
                  getCustomTextW6S22(
                    text: 'Congratulations',
                    color: textWhiteColor,
                  ),
                  const Spacer()
                ],
              ),
            ),
            Positioned(
              top: 15.h,
              right: 0,
              left: 0,
              child: Container(
                width: 100.h,
                height: 100.h - 20.h,
                padding: EdgeInsets.only(top: 2.h),
                alignment: Alignment.topCenter,
                margin: EdgeInsets.symmetric(horizontal: 3.h),
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(10.px))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    getCustomTextW6S15(
                        text: 'Get cash from\nAl Ansari Exchange',
                        color: textBlackColor,
                        textAlign: TextAlign.center),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        getSvgImage('back_logo.svg', height: 29.h),
                        getSvgImage('qr_code.svg', height: 22.5.h),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: fillColorButton(
                              color: pinkAppColor, text: 'Download Receipt'),
                        ),
                        getVerSpace(1.5.h),
                        GestureDetector(
                          onTap: () {},
                          child: outlineButton(
                              color: backgroundColor,
                              borderColor: pinkAppColor,
                              text: 'Take Screenshot'),
                        ),
                        getVerSpace(1.5.h),
                        GestureDetector(
                          onTap: () {
                            Get.offAll(() => const BottomNavBarFreelancerScreen());
                          },
                          child: outlineButton(
                              color: backgroundColor,
                              borderColor: pinkAppColor,
                              text: 'Go to Dashboard'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
