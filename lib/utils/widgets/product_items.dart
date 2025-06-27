import 'package:e_commerce/utils/UColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget ProductItem(
  String imgUrl,
  String discount,
  String nameProduct,
  String manufacturer,
) {
  return Container(
    width: 160.w,
    margin: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: UColors.buttonPrimary10,
      borderRadius: BorderRadius.circular(12),
      // border: Border.all(color: Colors.blue, width: 2),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(imgUrl, height: 100.h, fit: BoxFit.contain),
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.yellow[700],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "$discount%",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: Icon(
                Icons.favorite_border,
                size: 16.sp,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4),
          child: Text(
            nameProduct,
            style: TextStyle(fontWeight: FontWeight.bold),
            // textAlign: TextAlign.start,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 12.w, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                manufacturer,
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
              SizedBox(width: 4),
              Icon(Icons.verified, color: Colors.blue, size: 14.sp),
            ],
          ),
        ),
      ],
    ),
  );
}
