import 'package:algorthimi/view/SettingScreens/notification_screen.dart';
import 'package:algorthimi/view/SettingScreens/personal_information_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';
import 'accounts_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SizedBox(
        width: 100.w,
        child: Column(
          children: [
            SizedBox(
              width: 100.h,
              child: Stack(
                children: [
                  Container(
                    height: 20.h,
                    width: 100.w,
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(left: 3.h, right: 3.h),
                    decoration: BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(4.h))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(),
                        ),
                        const Spacer(),
                        getCustomTextW6S22(
                          text: 'Settings',
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
                      height: 5.h,
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.h),
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.symmetric(horizontal: 3.h),
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.px),
                            topLeft: Radius.circular(10.px)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            getVerSpace(1.h),
            Expanded(
              child: SizedBox(
                width: 100.w,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCustomTextW6S16(
                            text: 'Your Account'.tr, color: accentColor),
                        getVerSpace(2.h),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const PersonalInformationScreen());
                          },
                          child: settingFirstCard(
                              title: 'Personal Information'.tr,
                              subTitle: 'Abdul Waheed'.tr,
                              arrowColor: borderColor,
                              icon: 'profile_icon.svg'),
                        ),
                        getVerSpace(1.5.h),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const AccountsScreen());
                          },
                          child: settingCard(
                              icon: 'card_icon.svg',
                              arrowColor: borderColor,
                              title: 'Accounts'),
                        ),
                        getVerSpace(1.5.h),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const NotificationScreen());
                          },
                          child: settingCard(
                              icon: 'notification_icon.svg',
                              arrowColor: borderColor,
                              title: 'Notifications'),
                        ),
                        getVerSpace(1.5.h),
                        getCustomTextW6S16(
                            text: 'Benefits'.tr, color: accentColor),
                        getVerSpace(2.h),
                        settingFirstCard(
                            title: 'Rewards'.tr,
                            subTitle: 'You have 568 points'.tr,
                            arrowColor: borderColor,
                            icon: 'reward_icon.svg'),
                        getVerSpace(1.5.h),
                        getCustomTextW6S16(
                            text: 'Support'.tr, color: accentColor),
                        getVerSpace(2.h),
                        settingCard(
                            icon: 'help_icon.svg',
                            arrowColor: borderColor,
                            title: 'Help'),
                        getVerSpace(1.5.h),
                        settingCard(
                            icon: 'rate_icon.svg',
                            arrowColor: borderColor,
                            title: 'Rate the App'),
                        getVerSpace(1.5.h),
                        getCustomTextW6S16(
                            text: 'Preferences'.tr, color: accentColor),
                        getVerSpace(2.h),
                        GestureDetector(
                          onTap: () {
                            showLanguageDialog();
                          },
                          child: settingFirstCard(
                              title: 'Language'.tr,
                              subTitle: 'English'.tr,
                              arrowColor: borderColor,
                              icon: 'language_icon.svg'),
                        ),
                        getVerSpace(3.h),
                        signOutButton(),
                        getVerSpace(4.h),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> showLanguageDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            elevation: 0,
            title: getCustomTextW6S20(
                text: 'Select Language'.tr, color: accentColor),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Get.back();
                },
                child: getCustomTextW6S15(
                    text: 'English'.tr, color: textBlackColor),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Get.back();
                },
                child: getCustomTextW6S15(
                    text: 'Arabic'.tr, color: textBlackColor),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Get.back();
                },
                child: getCustomTextW6S15(
                    text: 'French'.tr, color: textBlackColor),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Get.back();
                },
                child: getCustomTextW6S15(
                    text: 'German'.tr, color: textBlackColor),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Get.back();
                },
                child:
                    getCustomTextW6S15(text: 'Urdu'.tr, color: textBlackColor),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Get.back();
                },
                child:
                    getCustomTextW6S15(text: 'Hindi'.tr, color: textBlackColor),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Get.back();
                },
                child: getCustomTextW6S15(
                    text: 'Malayalam'.tr, color: textBlackColor),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Get.back();
                },
                child: getCustomTextW6S15(
                    text: 'Bengali'.tr, color: textBlackColor),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Get.back();
                },
                child: getCustomTextW6S15(
                    text: 'Nepali'.tr, color: textBlackColor),
              ),
            ],
          );
        });
  }
}
