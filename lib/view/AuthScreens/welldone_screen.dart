import 'package:algorthimi/view/BottomNavBar/bottom_nav_bar_freelancer_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../BottomNavBar/bottom_nav_bar_shop_owner_screen.dart';
import '../Widgets/widget_utils.dart';

class WellDoneScreen extends StatefulWidget {
  WellDoneScreen(
      {Key? key, this.screenTitle, this.selectedMethod, this.userType})
      : super(key: key);
  dynamic screenTitle;
  dynamic selectedMethod;
  dynamic userType;

  @override
  State<WellDoneScreen> createState() => _WellDoneScreenState();
}

class _WellDoneScreenState extends State<WellDoneScreen> {
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
                    text: widget.screenTitle == 'otp'
                        ? 'WellDone'
                        : 'Congratulations',
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
                    Column(
                      children: [
                        getSvgImage(
                            widget.screenTitle == 'otp' ||
                                    widget.screenTitle == 'otpLicense' ||
                                    widget.screenTitle == 'addBank'
                                ? 'welldone_smile.svg'
                                : 'congratulations_smile.svg',
                            height: widget.screenTitle == 'otp' ||
                                    widget.screenTitle == 'otpLicense'
                                ? 6.5.h
                                : 7.h),
                        getVerSpace(2.h),
                        getCustomTextW6S15(
                            text: widget.screenTitle == 'otp' ||
                                    widget.screenTitle == 'otpLicense'
                                ? 'You have successfully registered\nyour ALGORITHMI account'
                                : widget.screenTitle == 'addBank'
                                    ? 'You have successfully added\nyour ${widget.selectedMethod} account'
                                    : widget.screenTitle == 'uploadFile'
                                        ? 'You\'re upload file and Submitted\nfor review'
                                        : 'Your survey has been Finished and\nSubmitted for review',
                            color: textBlackColor,
                            textAlign: TextAlign.center),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        getSvgImage('back_logo.svg', height: 29.h),
                        getSvgImage(
                            widget.screenTitle == 'otp' ||
                                    widget.screenTitle == 'otpLicense' ||
                                    widget.screenTitle == 'addBank'
                                ? 'welldone_first.svg'
                                : 'congratulations_first.svg',
                            height: widget.screenTitle == 'otp' ||
                                    widget.screenTitle == 'otpLicense'
                                ? 20.h
                                : 22.5.h),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.screenTitle == 'otpLicense' ||
                                widget.userType == 'shopOwner'
                            ? Get.offAll(
                                () => const BottomNavBarShopOwnerScreen())
                            : Get.offAll(
                                () => const BottomNavBarFreelancerScreen());
                      },
                      child: fillColorButton(
                          color: pinkAppColor, text: 'Go to Dashboard'),
                    )
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
