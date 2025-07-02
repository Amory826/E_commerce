import 'package:e_commerce/app/models/brand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget BrandItems(Brand brand) {
  return InkWell(
    onTap: () {},
    borderRadius: BorderRadius.circular(12),
    child: Container(
      margin: EdgeInsets.only(right: 8.w, left: 8.w),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo (fixed height)
          Image.asset(
            brand.urlBrand ?? "",
            height: 24.h,
            width: 24.w,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 8.h),
          // Name + Verified
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      brand.nameBrand ?? "",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(Icons.verified, color: Colors.blue, size: 14.sp),
                ],
              ),
              SizedBox(height: 4.h),
              // Quantity
              Text(
                "${brand.quantity ?? 0} products",
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
