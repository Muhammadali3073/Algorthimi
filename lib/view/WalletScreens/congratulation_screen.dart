import 'package:algorthimi/view/BottomNavBar/bottom_nav_bar_freelancer_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';

class CongratulationTransferBankEWalletScreen extends StatefulWidget {
  CongratulationTransferBankEWalletScreen({Key? key, this.selectedMethod})
      : super(key: key);
  dynamic selectedMethod;

  @override
  State<CongratulationTransferBankEWalletScreen> createState() =>
      _CongratulationTransferBankEWalletScreenState();
}

class _CongratulationTransferBankEWalletScreenState
    extends State<CongratulationTransferBankEWalletScreen> {
  back() {
    Get.back();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return back();
      },
      child: Scaffold(
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
                      Column(
                        children: [
                          getSvgImage('congratulations_smile.svg', height: 7.h),
                          getVerSpace(2.h),
                          widget.selectedMethod == 'withdrawCrypto'
                              ? Container()
                              : getCustomTextW6S20(
                                  text: '500 AED', color: greenColor),
                          widget.selectedMethod == 'withdrawCrypto'
                              ? getCustomTextW6S15(
                                  text:
                                      'Your transaction has been\nSuccessful\n\n',
                                  color: textBlackColor,
                                  textAlign: TextAlign.center)
                              : getCustomTextW6S15(
                                  text:
                                      'has been successfully transferred to\nyour ${widget.selectedMethod} account\n\nRemaining Balance',
                                  color: textBlackColor,
                                  textAlign: TextAlign.center),
                          widget.selectedMethod == 'withdrawCrypto'
                              ? getCustomTextW6S20(
                                  text: '9 Coins', color: accentColor)
                              : getCustomTextW6S20(
                                  text: '500 AED', color: accentColor),
                        ],
                      ),
                      widget.selectedMethod == 'withdrawCrypto'
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                getSvgImage('back_logo.svg', height: 29.h),
                                getSvgImage('coin_icon.svg', height: 14.h),
                              ],
                            )
                          : getSvgImage('back_logo.svg', height: 29.h),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: fillColorButton(
                                color: pinkAppColor,
                                text: widget.selectedMethod == 'withdrawCrypto'
                                    ? 'Transaction History'
                                    : 'Download Receipt'),
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
      ),
    );
  }
}
