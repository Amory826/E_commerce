import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/modules/home/views/home_view.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  runApp(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: AppPages.routes,
        // title: "Liforte Hotel",
        initialRoute: Routes.BASE,
        // home: HomeView(),
      ),
    ),
  );
}
