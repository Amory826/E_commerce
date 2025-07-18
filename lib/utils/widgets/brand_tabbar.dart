import 'package:e_commerce/app/models/product.dart';
import 'package:e_commerce/utils/UColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget BrandTabBar(String brand) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius:
          BorderRadius.only(
            topLeft: Radius.circular(10).w,
            topRight: Radius.circular(10),
          ).w,
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        brand,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          color: UColors.black,
        ),
      ),
    ),
  );
}
