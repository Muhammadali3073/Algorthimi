import 'package:algorthimi/view/DashboardScreens/start_questions_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controller/geo_location_controller.dart';
import '../../utils/color_data.dart';
import '../../utils/data.dart';
import '../Widgets/widget_utils.dart';

class DashBoardFreelancerScreen extends StatefulWidget {
  const DashBoardFreelancerScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardFreelancerScreen> createState() =>
      _DashBoardFreelancerScreenState();
}

class _DashBoardFreelancerScreenState extends State<DashBoardFreelancerScreen> {
  LocationController locationController = Get.find(tag: 'locationController');
  GoogleMapController? googleMapController;
  Set<Marker> markers = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locationController.getAddress();
    List.generate(
      DataFile.citiesLatLongModel.length,
      (index) {
        return createMarker(
            markerColor: DataFile.citiesLatLongModel[index].markerColor,
            markerId: DataFile.citiesLatLongModel[index].markerID,
            title: DataFile.citiesLatLongModel[index].cityName,
            lat: DataFile.citiesLatLongModel[index].cityLat,
            long: DataFile.citiesLatLongModel[index].cityLong);
      },
    );
  }

  onMapCreated(GoogleMapController controller) async {
    controller = controller;
    String value =
        await DefaultAssetBundle.of(context).loadString('assets/map.json');
    controller.setMapStyle(value);
  }

  createMarker({markerColor, markerId, title, lat, long}) {
    markers.add(Marker(
      markerId: MarkerId(markerId),
      infoWindow: InfoWindow(title: title),
      icon: BitmapDescriptor.defaultMarkerWithHue(markerColor),
      position: LatLng(lat, long),
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          elevation: 5,
          builder: (BuildContext context) {
            return Container(
              width: 100.w,
              height: 28.h,
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.h),
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.px),
                      topRight: Radius.circular(15.px))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          getCustomTextW6S17(
                              text: 'Questionnaire'.tr, color: greenColor),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.close,
                              color: subTextColor,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                      getVerSpace(1.h),
                      getCustomTextW6S12(
                          text:
                              "1) Does the location have a POS system.\n2) # of counters.\n3) Sales of tobacco.\n4) Attach image of tobacco shelf.\n5) Ask shop keep top selling brands.\n6) Sales of energy drinks.",
                          color: subTextColor)
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          Get.to(() =>  StartQuestionsScreen(userType: 'freelancer',));
                        },
                        child: fillColorButton(
                            text: 'Accept',
                            color: pinkAppColor,
                            paddingVertical: 0.7.h),
                      )),
                      getHorSpace(1.h),
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: outlineButton(
                            borderColor: pinkAppColor,
                            text: 'Cancel',
                            color: backgroundColor,
                            paddingVertical: 0.7.h),
                      )),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          children: [
            SizedBox(
              height: 45.h,
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
                          text: 'Dashboard',
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
                      height: 28.h,
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.h),
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.symmetric(horizontal: 3.h),
                      decoration: BoxDecoration(
                          color: backgroundColor,
                          boxShadow: [
                            BoxShadow(
                              color: borderColor,
                              blurRadius: 1,
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.px))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  getSvgImage('app_logo.svg', height: 4.8.h),
                                  getHorSpace(2.h),
                                  getCustomTextW6S16(
                                      text: 'ALGORTHIMI', color: accentColor)
                                ],
                              ),
                              getSvgImage('person_icon.svg', height: 8.3.h),
                            ],
                          ),
                          getCustomTextW6S20(
                              text: 'Muhammad Usman', color: textBlackColor),
                          Row(
                            children: [
                              getCustomTextW6S16(
                                  text: 'Verified Account', color: greenColor),
                              getHorSpace(1.h),
                              getSvgImage('verify_account-icon.svg'),
                            ],
                          ),
                          getVerSpace(0.5.h),
                          RichText(
                            text: TextSpan(
                                text: 'Current location: '.tr,
                                style: getCustomTextStyleW4S13(
                                  color: subTextColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Al Barai, Dubai'.tr,
                                    style: getCustomTextStyleW10S13(
                                      color: subTextColor,
                                    ),
                                  )
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Account Type: '.tr,
                                style: getCustomTextStyleW4S13(
                                  color: subTextColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Freelancer'.tr,
                                    style: getCustomTextStyleW10S13(
                                      color: subTextColor,
                                    ),
                                  )
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Member Status: '.tr,
                                style: getCustomTextStyleW4S13(
                                  color: subTextColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Bronze'.tr,
                                    style: getCustomTextStyleW10S13(
                                      color: subTextColor,
                                    ),
                                  )
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                text: 'Questioners: '.tr,
                                style: getCustomTextStyleW4S13(
                                  color: subTextColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: '3/5 Approved'.tr,
                                    style: getCustomTextStyleW10S13(
                                      color: subTextColor,
                                    ),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => Container(
                  margin: EdgeInsets.only(right: 3.h, left: 3.h, bottom: 3.h),
                  child: GoogleMap(
                    onMapCreated: onMapCreated,
                    markers: markers,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: false,
                    mapToolbarEnabled: false,
                    compassEnabled: false,
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(locationController.lat.value,
                          locationController.lng.value),
                      zoom: 14.0,
                      tilt: 0,
                      bearing: 0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
