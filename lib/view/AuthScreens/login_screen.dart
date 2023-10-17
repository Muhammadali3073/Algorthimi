import 'package:algorthimi/view/BottomNavBar/bottom_nav_bar_freelancer_screen.dart';
import 'package:algorthimi/view/BottomNavBar/bottom_nav_bar_shop_owner_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';
import 'forgot_password_screen.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isShowPassword = true.obs;
  var isCheck = false.obs;
  var isSigningIn = false.obs;

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
                  getCustomTextW6S22(text: 'Login', color: textWhiteColor),
                ],
              ),
              Column(
                children: [
                  getCustomTextFormField(
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    hintText: 'Enter Your Email'.tr,
                    controller: emailController,
                    validator: (value) => EmailValidator.validate(value!)
                        ? null
                        : "Please enter a valid email".tr,
                  ),
                  getVerSpace(2.5.h),
                  getCustomTextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isShowPassword.value,
                    controller: passwordController,
                    hintText: 'Enter Your Password'.tr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password not be empty!".tr;
                      } else if (value.length <= 4) {
                        return "Password must be greater than 5 character!".tr;
                      } else {
                        return null;
                      }
                    },
                    suffixIcon: GestureDetector(
                        onTap: () {
                          isShowPassword.value = !isShowPassword.value;
                        },
                        child: isShowPassword.value
                            ? Icon(
                                Icons.remove_red_eye_sharp,
                                color: textBlackColor,
                                size: 20.px,
                              )
                            : Icon(
                                Icons.password,
                                color: textBlackColor,
                                size: 20.px,
                              )),
                  ),
                  getVerSpace(2.5.h),
                  GestureDetector(
                    onTap: () {
                      Get.to(()=>const ForgotPasswordScreen());
                    },
                    child: getCustomTextW6S15(
                        text: 'Forgot Password?', color: textWhiteColor),
                  ),
                  getVerSpace(3.h),
                  GestureDetector(
                      onTap: () {
                        // Get.to(() => const BottomNavBarFreelancerScreen());
                        Get.to(() => const BottomNavBarShopOwnerScreen());
                      },
                      child:
                          fillColorButton(color: pinkAppColor, text: 'Login')),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const SignUpScreen());
                },
                child: RichText(
                  text: TextSpan(
                      text: 'Don’t have an account ?   '.tr,
                      style: getCustomTextStyleW5S15(
                        color: textWhiteColor,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign Up'.tr,
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
