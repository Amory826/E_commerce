import 'package:e_commerce/app/models/product.dart';
import 'package:e_commerce/utils/UColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget ProductItem(Product product) {
  return InkWell(
    onTap: () {},
    borderRadius: BorderRadius.circular(12),
    child: Container(
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
                  child: Image.asset(
                    product.imagePath ?? "",
                    height: 100.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: 16,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 4,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "${product.discountPercent}%",
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
                  size: 20.sp,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4),
            child: Text(
              product.name ?? "",
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
                  product.brand ?? "",
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
                SizedBox(width: 4),
                Icon(Icons.verified, color: Colors.blue, size: 14.sp),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '\$${product.price}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      '\$${product.oldPrice}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 24.h,
                  width: 24.w,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: IconButton(
                    alignment: Alignment.center,
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.add, color: Colors.white, size: 16.sp),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
