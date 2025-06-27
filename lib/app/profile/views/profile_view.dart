import 'package:e_commerce/app/profile/controllers/profile_controller.dart';
import 'package:e_commerce/utils/UColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/widgets/Circle.dart';
import '../../../utils/widgets/CustomClipper.dart';
import '../../../utils/widgets/infor_profile.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  clipper: BottomWaveClipper(),
                  child: Container(
                    height: 180.h,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 24.h,
                    ),
                    color: const Color(0xFF1E56A0),
                    child: Padding(padding: const EdgeInsets.only(top: 20)),
                  ),
                ),
                Positioned(
                  bottom: -20.h,
                  left: 24.w,
                  right: 24.w,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: UColors.primary, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Circle(width: 125.w, height: 125.h),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Unknown Pro",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.sp,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "unknownpro@gmail.com",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Nunito",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              ],
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.only(left: 16),
              alignment: AlignmentDirectional.topStart,
              child: Text(
                "Account Settings",
                style: TextStyle(
                  fontFamily: "Nunito",
                  color: Colors.black,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            InfoProfileItem(
              Icons.home_outlined,
              "My Addresses",
              "Set shopping delivery addresses",
            ),
            InfoProfileItem(
              Icons.shopping_cart_outlined,
              "My Cart",
              "Add, remove products and move to checkout",
            ),
            InfoProfileItem(
              Icons.ondemand_video_rounded,
              "My Orders",
              "In-progress and Completed Orders",
            ),
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(8),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontFamily: "Nunito",
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
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
