import 'package:e_commerce/utils/UColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.h,
            pinned: true,
            floating: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(32),
                child: Image.asset(
                  '${controller.product.value.imagePath}',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: UColors.black),
                onPressed: () => Get.back(),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    size: 28.sp,
                    color: UColors.black,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),

          // Nội dung còn lại
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 6,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.yellow[700],
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              "${controller.product.value.discountPercent}%",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Row(
                            children: [
                              Text(
                                '\$${controller.product.value.price}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.sp,
                                ),
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                '\$${controller.product.value.oldPrice}',
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.share,
                          size: 28.sp,
                          color: UColors.black,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "${controller.product.value.name}",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      color: Colors.black,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "Stock: ",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        (controller.product.value.stock ?? true)
                            ? "In Stock"
                            : "No Stock",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Image.asset(
                        "assets/brands/apple.png",
                        height: 24.h,
                        width: 24.w,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 4),
                      Text(
                        controller.product.value.brand ?? "",
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.verified, color: Colors.blue, size: 14.sp),
                    ],
                  ),
                  // Thêm nội dung tùy ý
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
