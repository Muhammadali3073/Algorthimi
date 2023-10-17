import 'package:algorthimi/view/SplashLanguageScreens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controller/geo_location_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LocationController locationController =
  Get.put(LocationController(), tag: 'locationController');
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: GoogleFonts.urbanist().toString(),
              useMaterial3: true,
              colorScheme: const ColorScheme.light(background: Colors.white)),
          home: const SplashScreen(),
        );
      },
    );
  }
}
