import 'dart:async';
import 'dart:developer';

import 'package:algorthimi/view/AuthScreens/scan_id_camera_screen.dart';
import 'package:algorthimi/view/AuthScreens/scan_id_camera_shop_owner_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/color_data.dart';
import '../Widgets/widget_utils.dart';
import 'welldone_screen.dart';

class ScanIdShopOwnerScreen extends StatefulWidget {
  const ScanIdShopOwnerScreen({Key? key}) : super(key: key);

  @override
  State<ScanIdShopOwnerScreen> createState() => _ScanIdShopOwnerScreenState();
}

class _ScanIdShopOwnerScreenState extends State<ScanIdShopOwnerScreen> {
  TextEditingController idNumberController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController licenseHolderFullNameController =
      TextEditingController();
  TextEditingController dateOfBrithController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController licenseHolderNationalityController =
      TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController telephoneNoController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController licenseActivitiesController = TextEditingController();
  TextEditingController licenseNoController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  String initialCountry = 'AE';
  PhoneNumber number = PhoneNumber(isoCode: 'AE');

  var currentStep = 0.obs;
  StepperType stepperType = StepperType.horizontal;

  back() {
    isScannedFreelancerId.value = false;
    isScannedShopOwnerId.value = false;
    isScannedShopOwnerLicense.value = false;
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
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
                  height: 22.h,
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
                          isScannedFreelancerId.value = false;
                          isScannedShopOwnerId.value = false;
                          isScannedShopOwnerLicense.value = false;
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back_ios_new_outlined,
                            color: backgroundColor, size: 2.5.h),
                      ),
                      const Spacer(),
                      getCustomTextW6S22(
                        text: currentStep.value == 0 &&
                                !isScannedShopOwnerId.value
                            ? 'Scan Your ID'
                            : currentStep.value == 0 || currentStep.value == 1
                                ? 'Personal Details\nConfirmation'
                                : currentStep.value == 2
                                    ? 'Mobile & Email\nConfirmation'
                                    : currentStep.value == 3 &&
                                            !isScannedShopOwnerLicense.value
                                        ? 'Scan Your License'
                                        : currentStep.value == 3 ||
                                                currentStep.value == 4
                                            ? 'License Details\nConfirmation'
                                            : 'Enter Verification\nCode',
                        color: textWhiteColor,
                      ),
                      const Spacer()
                    ],
                  ),
                ),
                Positioned(
                  top: 16.h,
                  right: 0,
                  left: 0,
                  child: Container(
                    width: 100.h,
                    height: 100.h,
                    padding: EdgeInsets.only(top: 2.h),
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.symmetric(horizontal: 3.h),
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(10.px))),
                    child: Theme(
                      data: ThemeData(
                        canvasColor: backgroundColor,
                        colorScheme: Theme.of(context)
                            .colorScheme
                            .copyWith(primary: accentColor),
                      ),
                      child: Stepper(
                        type: stepperType,
                        elevation: 0,
                        physics: const NeverScrollableScrollPhysics(),
                        currentStep: currentStep.value,
                        onStepTapped: (step) => tapped(step),
                        onStepContinue: continued,
                        onStepCancel: cancel,
                        controlsBuilder:
                            (BuildContext context, ControlsDetails details) {
                          return Obx(
                            () => isScannedShopOwnerId.value
                                ? currentStep.value == 5
                                    ? Container()
                                    : currentStep.value != 3 ||
                                            isScannedShopOwnerLicense.value ==
                                                true
                                        ? Row(children: [
                                            Expanded(
                                                child: ElevatedButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStatePropertyAll(
                                                          pinkAppColor),
                                                  overlayColor:
                                                      MaterialStatePropertyAll(
                                                          pinkAppColor.withOpacity(
                                                              0.1)),
                                                  side: MaterialStateProperty.all(
                                                      BorderSide(
                                                          color: pinkAppColor,
                                                          width: 1.5,
                                                          style: BorderStyle
                                                              .solid)),
                                                  shape: MaterialStatePropertyAll(
                                                      RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(10.px)))),
                                                  padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 1.6.h))),
                                              onPressed: details.onStepContinue,
                                              child: getCustomTextW6S16(
                                                text: currentStep.value == 5
                                                    ? 'Confirm'
                                                    : 'Next',
                                                color: textWhiteColor,
                                              ),
                                            )),
                                            if (currentStep.value != 0)
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    getHorSpace(2.h),
                                                    Expanded(
                                                      child: OutlinedButton(
                                                          style: ButtonStyle(
                                                              overlayColor: MaterialStatePropertyAll(
                                                                  pinkAppColor
                                                                      .withOpacity(
                                                                          0.1)),
                                                              side: MaterialStateProperty
                                                                  .all(BorderSide(
                                                                      color:
                                                                          pinkAppColor,
                                                                      width:
                                                                          1.5,
                                                                      style: BorderStyle
                                                                          .solid)),
                                                              shape: MaterialStatePropertyAll(
                                                                  RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(Radius.circular(10.px)))),
                                                              padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 1.6.h))),
                                                          onPressed: details.onStepCancel,
                                                          child: getCustomTextW6S16(text: 'Back', color: pinkAppColor)),
                                                    ),
                                                  ],
                                                ),
                                              )
                                          ])
                                        : Container()
                                : Container(),
                          );
                        },
                        steps: <Step>[
                          Step(
                            title: const Text(''),
                            content: isScannedShopOwnerId.value
                                ? Column(
                                    children: [
                                      getCustomTextW6S15(
                                          text:
                                              'Please confirm your\nPersonal Information',
                                          color: textBlackColor,
                                          textAlign: TextAlign.center),
                                      getVerSpace(2.h),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: getCustomTextW6S15(
                                                text: 'ID Number',
                                                color: subTextColor),
                                          ),
                                          Expanded(
                                              flex: 2,
                                              child: getCustomTextFormField(
                                                keyboardType:
                                                    const TextInputType
                                                            .numberWithOptions(
                                                        signed: true,
                                                        decimal: true),
                                                obscureText: false,
                                                hintText: 'ID Number'.tr,
                                                controller: idNumberController,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "ID Number not be empty!"
                                                        .tr;
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                              ))
                                        ],
                                      ),
                                      Divider(color: subTextColor),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: getCustomTextW6S15(
                                                text: 'Full Name',
                                                color: subTextColor),
                                          ),
                                          Expanded(
                                              flex: 2,
                                              child: getCustomTextFormField(
                                                keyboardType:
                                                    TextInputType.text,
                                                obscureText: false,
                                                hintText: 'Full Name'.tr,
                                                controller: fullNameController,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Full Name not be empty!"
                                                        .tr;
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                              ))
                                        ],
                                      ),
                                      Divider(color: subTextColor),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: getCustomTextW6S15(
                                                text: 'Nationality',
                                                color: subTextColor),
                                          ),
                                          Expanded(
                                              flex: 2,
                                              child: getCustomTextFormField(
                                                keyboardType:
                                                    TextInputType.text,
                                                obscureText: false,
                                                hintText: 'Nationality'.tr,
                                                controller:
                                                    nationalityController,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Nationality not be empty!"
                                                        .tr;
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                              ))
                                        ],
                                      ),
                                      getVerSpace(2.h),
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      RichText(
                                        text: TextSpan(
                                            text: 'Scan the back of your '.tr,
                                            style: getCustomTextStyleW5S15(
                                              color: textBlackColor,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: 'Emirates ID'.tr,
                                                style: getCustomTextStyleW7S15(
                                                  color: textBlackColor,
                                                ),
                                              ),
                                            ]),
                                      ),
                                      getVerSpace(10.h),
                                      getSvgImage('scan_id.svg', height: 23.h),
                                      getVerSpace(10.h),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(
                                              () => const ScanIdCameraScreen());
                                        },
                                        child: fillColorButton(
                                          color: pinkAppColor,
                                          text: 'Start Scanning',
                                        ),
                                      ),
                                      getVerSpace(2.h),
                                    ],
                                  ),
                            isActive: currentStep.value >= 0,
                            state: currentStep.value == 0
                                ? StepState.editing
                                : StepState.complete,
                          ),
                          Step(
                            title: const Text(''),
                            content: Column(
                              children: <Widget>[
                                getCustomTextW6S15(
                                    text:
                                        'Please confirm your\nPersonal Information',
                                    color: textBlackColor,
                                    textAlign: TextAlign.center),
                                getVerSpace(2.h),
                                Row(
                                  children: [
                                    Expanded(
                                      child: getCustomTextW6S15(
                                          text: 'Card Number',
                                          color: subTextColor),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: getCustomTextFormField(
                                          keyboardType: const TextInputType
                                                  .numberWithOptions(
                                              signed: true, decimal: true),
                                          obscureText: false,
                                          hintText: 'Card Number'.tr,
                                          controller: cardNumberController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Card Number not be empty!"
                                                  .tr;
                                            } else {
                                              return null;
                                            }
                                          },
                                        ))
                                  ],
                                ),
                                Divider(color: subTextColor),
                                Row(
                                  children: [
                                    Expanded(
                                      child: getCustomTextW6S15(
                                          text: 'Date of Birth',
                                          color: subTextColor),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: getCustomTextFormField(
                                          obscureText: false,
                                          readOnly: true,
                                          onTap: () async {
                                            await showCupertinoModalPopup<void>(
                                              context: context,
                                              builder: (_) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: backgroundColor,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                          12.px),
                                                      topRight: Radius.circular(
                                                          12.px),
                                                    ),
                                                  ),
                                                  height: 25.h,
                                                  child: CupertinoDatePicker(
                                                    mode:
                                                        CupertinoDatePickerMode
                                                            .date,
                                                    onDateTimeChanged: (value) {
                                                      dateOfBrithController
                                                              .text =
                                                          value
                                                              .toString()
                                                              .substring(0, 10);
                                                    },
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          hintText: 'Date of Birth'.tr,
                                          controller: dateOfBrithController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Date of Birth not be empty!"
                                                  .tr;
                                            } else {
                                              return null;
                                            }
                                          },
                                        ))
                                  ],
                                ),
                                Divider(color: subTextColor),
                                Row(
                                  children: [
                                    Expanded(
                                      child: getCustomTextW6S15(
                                          text: 'Expiry Date',
                                          color: subTextColor),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: getCustomTextFormField(
                                          obscureText: false,
                                          readOnly: true,
                                          onTap: () async {
                                            await showCupertinoModalPopup<void>(
                                              context: context,
                                              builder: (_) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    color: backgroundColor,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                          12.px),
                                                      topRight: Radius.circular(
                                                          12.px),
                                                    ),
                                                  ),
                                                  height: 25.h,
                                                  child: CupertinoDatePicker(
                                                    mode:
                                                        CupertinoDatePickerMode
                                                            .date,
                                                    onDateTimeChanged: (value) {
                                                      expiryDateController
                                                              .text =
                                                          value
                                                              .toString()
                                                              .substring(0, 10);
                                                    },
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          hintText: 'Expiry Date'.tr,
                                          controller: expiryDateController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Expiry Date not be empty!"
                                                  .tr;
                                            } else {
                                              return null;
                                            }
                                          },
                                        ))
                                  ],
                                ),
                                Divider(color: subTextColor),
                                Row(
                                  children: [
                                    Expanded(
                                      child: getCustomTextW6S15(
                                          text: 'Gender', color: subTextColor),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: getCustomTextFormField(
                                          obscureText: false,
                                          readOnly: true,
                                          onTap: () {
                                            showModalBottomSheet<void>(
                                              context: context,
                                              elevation: 5,
                                              builder: (BuildContext context) {
                                                return Container(
                                                  width: 100.w,
                                                  height: 25.h,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 2.h),
                                                  decoration: BoxDecoration(
                                                      color: backgroundColor,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      15.px),
                                                              topRight: Radius
                                                                  .circular(
                                                                      15.px))),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          genderController
                                                                  .text =
                                                              'Male'.toString();
                                                          Get.back();
                                                        },
                                                        child: Container(
                                                          width: 100.w,
                                                          alignment:
                                                              Alignment.center,
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      3.h),
                                                          decoration:
                                                              BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                          color:
                                                                              textBlackColor),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius.circular(
                                                                        10.px),
                                                                  )),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      1.h),
                                                          child:
                                                              getCustomTextW6S15(
                                                            text: 'Male',
                                                            color:
                                                                textBlackColor,
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          genderController
                                                                  .text =
                                                              'Female'
                                                                  .toString();
                                                          Get.back();
                                                        },
                                                        child: Container(
                                                          width: 100.w,
                                                          alignment:
                                                              Alignment.center,
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      3.h),
                                                          decoration:
                                                              BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                          color:
                                                                              textBlackColor),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius.circular(
                                                                        10.px),
                                                                  )),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      1.h),
                                                          child:
                                                              getCustomTextW6S15(
                                                            text: 'Female',
                                                            color:
                                                                textBlackColor,
                                                          ),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          genderController
                                                                  .text =
                                                              'Other'
                                                                  .toString();
                                                          Get.back();
                                                        },
                                                        child: Container(
                                                          width: 100.w,
                                                          alignment:
                                                              Alignment.center,
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      3.h),
                                                          decoration:
                                                              BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                          color:
                                                                              textBlackColor),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius.circular(
                                                                        10.px),
                                                                  )),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical:
                                                                      1.h),
                                                          child:
                                                              getCustomTextW6S15(
                                                            text: 'Other',
                                                            color:
                                                                textBlackColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          hintText: 'Gender'.tr,
                                          controller: genderController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Gender not be empty!".tr;
                                            } else {
                                              return null;
                                            }
                                          },
                                        ))
                                  ],
                                ),
                                getVerSpace(2.h),
                              ],
                            ),
                            isActive: currentStep.value >= 1,
                            state: currentStep.value == 1
                                ? StepState.editing
                                : currentStep.value >= 1
                                    ? StepState.complete
                                    : StepState.disabled,
                          ),
                          Step(
                            title: const Text(''),
                            content: Column(
                              children: <Widget>[
                                getCustomTextW6S15(
                                    text:
                                        'Please provide your Mobile Phone Number and Email to continue',
                                    color: textBlackColor,
                                    textAlign: TextAlign.center),
                                getVerSpace(2.h),
                                InternationalPhoneNumberInput(
                                  onInputChanged: (PhoneNumber number) {
                                    log(number.phoneNumber.toString());
                                  },
                                  onInputValidated: (bool value) {
                                    log(value.toString());
                                  },
                                  selectorConfig: const SelectorConfig(
                                    selectorType: PhoneInputSelectorType.DIALOG,
                                  ),
                                  ignoreBlank: false,
                                  autoValidateMode: AutovalidateMode.disabled,
                                  selectorTextStyle:
                                      const TextStyle(color: Colors.black),
                                  initialValue: number,
                                  textFieldController: phoneNumberController,
                                  formatInput: true,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                  isEnabled: true,
                                  inputDecoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: backgroundColor,
                                            width: 1.0.px),
                                        borderRadius:
                                            BorderRadius.circular(10.0.px)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: backgroundColor,
                                            width: 1.0.px),
                                        borderRadius:
                                            BorderRadius.circular(10.0.px)),
                                    border: UnderlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0.px)),
                                    fillColor: backgroundColor,
                                    hintText: 'Phone Number',
                                    hintStyle: getCustomTextStyleW5S15(
                                      color: textBlackColor,
                                    ),
                                    enabled: true,
                                  ),
                                  cursorColor: textBlackColor,
                                  onSaved: (PhoneNumber number) {
                                    log('On Saved: $number');
                                  },
                                ),
                                Divider(color: subTextColor),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: getCustomTextW6S15(
                                          text: 'Email', color: subTextColor),
                                    ),
                                    getHorSpace(2.h),
                                    Expanded(
                                        flex: 2,
                                        child: getCustomTextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          obscureText: false,
                                          hintText: 'Enter Your Email'.tr,
                                          controller: emailController,
                                          validator: (value) =>
                                              EmailValidator.validate(value!)
                                                  ? null
                                                  : "Please enter a valid email"
                                                      .tr,
                                        ))
                                  ],
                                ),
                                getVerSpace(2.h),
                              ],
                            ),
                            isActive: currentStep.value >= 2,
                            state: currentStep.value == 2
                                ? StepState.editing
                                : currentStep.value >= 2
                                    ? StepState.complete
                                    : StepState.disabled,
                          ),
                          Step(
                            title: const Text(''),
                            content: isScannedShopOwnerLicense.value
                                ? Column(
                                    children: [
                                      getCustomTextW6S15(
                                          text:
                                              'Please confirm your\nLicense Information',
                                          color: textBlackColor,
                                          textAlign: TextAlign.center),
                                      getVerSpace(2.h),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: getCustomTextW6S15(
                                                text: 'License No',
                                                color: subTextColor),
                                          ),
                                          Expanded(
                                              flex: 2,
                                              child: getCustomTextFormField(
                                                keyboardType:
                                                    const TextInputType
                                                            .numberWithOptions(
                                                        signed: true,
                                                        decimal: true),
                                                obscureText: false,
                                                hintText: 'License No'.tr,
                                                controller: licenseNoController,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "License No not be empty!"
                                                        .tr;
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                              ))
                                        ],
                                      ),
                                      Divider(color: subTextColor),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: getCustomTextW6S15(
                                                text: 'Full Name',
                                                color: subTextColor),
                                          ),
                                          Expanded(
                                              flex: 2,
                                              child: getCustomTextFormField(
                                                keyboardType:
                                                    TextInputType.text,
                                                obscureText: false,
                                                hintText: 'Full Name'.tr,
                                                controller:
                                                    licenseHolderFullNameController,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Full Name not be empty!"
                                                        .tr;
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                              ))
                                        ],
                                      ),
                                      Divider(color: subTextColor),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: getCustomTextW6S15(
                                                text: 'Nationality',
                                                color: subTextColor),
                                          ),
                                          Expanded(
                                              flex: 2,
                                              child: getCustomTextFormField(
                                                keyboardType:
                                                    TextInputType.text,
                                                obscureText: false,
                                                hintText: 'Nationality'.tr,
                                                controller:
                                                    licenseHolderNationalityController,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Nationality not be empty!"
                                                        .tr;
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                              ))
                                        ],
                                      ),
                                      getVerSpace(2.h),
                                    ],
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                            text: 'Scan the back of your\n'.tr,
                                            style: getCustomTextStyleW5S15(
                                              color: textBlackColor,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: 'Trade License'.tr,
                                                style: getCustomTextStyleW7S15(
                                                  color: textBlackColor,
                                                ),
                                              ),
                                            ]),
                                      ),
                                      getVerSpace(10.h),
                                      getSvgImage('scan_id_shop_owner.svg',
                                          height: 25.h),
                                      getVerSpace(10.h),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() =>
                                              const ScanIdCameraShopOwnerScreen());
                                        },
                                        child: fillColorButton(
                                          color: pinkAppColor,
                                          text: 'Start Scanning',
                                        ),
                                      ),
                                      getVerSpace(2.h),
                                    ],
                                  ),
                            isActive: currentStep.value >= 3,
                            state: currentStep.value == 3
                                ? StepState.editing
                                : currentStep.value >= 3
                                    ? StepState.complete
                                    : StepState.disabled,
                          ),
                          Step(
                            title: const Text(''),
                            content: Column(
                              children: <Widget>[
                                getCustomTextW6S15(
                                    text:
                                        'Please confirm your\nLicense Information',
                                    color: textBlackColor,
                                    textAlign: TextAlign.center),
                                getVerSpace(2.h),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: getCustomTextW6S15(
                                          text: 'License Activities',
                                          color: subTextColor),
                                    ),
                                    getHorSpace(2.h),
                                    Expanded(
                                        flex: 2,
                                        child: getCustomTextFormField(
                                          keyboardType: TextInputType.text,
                                          obscureText: false,
                                          hintText: 'License Activities'.tr,
                                          controller:
                                              licenseActivitiesController,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "License Activities not be empty!"
                                                  .tr;
                                            } else {
                                              return null;
                                            }
                                          },
                                        ))
                                  ],
                                ),
                                Divider(color: subTextColor),
                                InternationalPhoneNumberInput(
                                  onInputChanged: (PhoneNumber number) {
                                    log(number.phoneNumber.toString());
                                  },
                                  onInputValidated: (bool value) {
                                    log(value.toString());
                                  },
                                  selectorConfig: const SelectorConfig(
                                    selectorType: PhoneInputSelectorType.DIALOG,
                                  ),
                                  ignoreBlank: false,
                                  autoValidateMode: AutovalidateMode.disabled,
                                  selectorTextStyle:
                                      const TextStyle(color: Colors.black),
                                  initialValue: number,
                                  textFieldController: telephoneNoController,
                                  formatInput: true,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                  isEnabled: true,
                                  inputDecoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: backgroundColor,
                                            width: 1.0.px),
                                        borderRadius:
                                            BorderRadius.circular(10.0.px)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: backgroundColor,
                                            width: 1.0.px),
                                        borderRadius:
                                            BorderRadius.circular(10.0.px)),
                                    border: UnderlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0.px)),
                                    fillColor: backgroundColor,
                                    hintText: 'Telephone No',
                                    hintStyle: getCustomTextStyleW5S15(
                                      color: textBlackColor,
                                    ),
                                    enabled: true,
                                  ),
                                  cursorColor: textBlackColor,
                                  onSaved: (PhoneNumber number) {
                                    log('On Saved: $number');
                                  },
                                ),
                                Divider(color: subTextColor),
                                InternationalPhoneNumberInput(
                                  onInputChanged: (PhoneNumber number) {
                                    log(number.phoneNumber.toString());
                                  },
                                  onInputValidated: (bool value) {
                                    log(value.toString());
                                  },
                                  selectorConfig: const SelectorConfig(
                                    selectorType: PhoneInputSelectorType.DIALOG,
                                  ),
                                  ignoreBlank: false,
                                  autoValidateMode: AutovalidateMode.disabled,
                                  selectorTextStyle:
                                      const TextStyle(color: Colors.black),
                                  initialValue: number,
                                  textFieldController: mobileNoController,
                                  formatInput: true,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                  isEnabled: true,
                                  inputDecoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: backgroundColor,
                                            width: 1.0.px),
                                        borderRadius:
                                            BorderRadius.circular(10.0.px)),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: backgroundColor,
                                            width: 1.0.px),
                                        borderRadius:
                                            BorderRadius.circular(10.0.px)),
                                    border: UnderlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0.px)),
                                    fillColor: backgroundColor,
                                    hintText: 'Mobile No',
                                    hintStyle: getCustomTextStyleW5S15(
                                      color: textBlackColor,
                                    ),
                                    enabled: true,
                                  ),
                                  cursorColor: textBlackColor,
                                  onSaved: (PhoneNumber number) {
                                    log('On Saved: $number');
                                  },
                                ),
                                getVerSpace(2.h),
                              ],
                            ),
                            isActive: currentStep.value >= 4,
                            state: currentStep.value == 4
                                ? StepState.editing
                                : currentStep.value >= 4
                                    ? StepState.complete
                                    : StepState.disabled,
                          ),
                          Step(
                            title: const Text(''),
                            content: Column(
                              children: <Widget>[
                                getCustomTextW6S15(
                                    text:
                                        'Please enter the OTP Code\nwe sent you',
                                    color: textBlackColor,
                                    textAlign: TextAlign.center),
                                getVerSpace(4.h),
                                PinCodeTextField(
                                  length: 4,
                                  keyboardType: TextInputType.phone,
                                  appContext: context,
                                  obscureText: false,
                                  animationType: AnimationType.fade,
                                  pinTheme: PinTheme(
                                      borderWidth: 1.px,
                                      shape: PinCodeFieldShape.box,
                                      borderRadius: BorderRadius.circular(5),
                                      selectedColor: pinkAppColor,
                                      selectedFillColor: backgroundColor,
                                      inactiveColor: subTextColor,
                                      inactiveFillColor: backgroundColor,
                                      fieldHeight: 5.5.h,
                                      fieldWidth: 4.h,
                                      activeColor: pinkAppColor,
                                      activeFillColor: backgroundColor,
                                      fieldOuterPadding: EdgeInsets.symmetric(
                                          horizontal: 1.1.h)),
                                  animationDuration:
                                      const Duration(milliseconds: 200),
                                  backgroundColor: backgroundColor,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  enableActiveFill: true,
                                  errorAnimationController: errorController,
                                  controller: otpController,
                                  onCompleted: (v) {
                                    isScannedFreelancerId.value = false;
                                    isScannedShopOwnerId.value = false;
                                    isScannedShopOwnerLicense.value = false;
                                    Get.to(() => WellDoneScreen(
                                          screenTitle: 'otpLicense',
                                        ));
                                    log("Completed\n OTP:${otpController.text}");
                                  },
                                  onChanged: (value) {},
                                  beforeTextPaste: (text) {
                                    log("Allowing to paste $text");
                                    return true;
                                  },
                                ),
                                getVerSpace(2.h),
                                getCustomTextW6S15(
                                    text: "I did not receive the OTP".tr,
                                    color: subTextColor),
                                getVerSpace(1.8.h),
                                getCustomTextW6S15(
                                    text: "Resend Code".tr,
                                    color: pinkAppColor),
                                getVerSpace(2.h),
                              ],
                            ),
                            isActive: currentStep.value >= 5,
                            state: currentStep.value == 5
                                ? StepState.editing
                                : currentStep.value >= 5
                                    ? StepState.complete
                                    : StepState.disabled,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  tapped(int step) {
    currentStep.value = step;
  }

  continued() {
    currentStep.value < 5 ? currentStep.value += 1 : null;
  }

  cancel() {
    currentStep.value > 0 ? currentStep.value -= 1 : null;
  }
}
