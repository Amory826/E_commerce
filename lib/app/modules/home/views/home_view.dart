import 'package:e_commerce/utils/UColors.dart';
import 'package:e_commerce/utils/widgets/CategoriesItems.dart';
import 'package:e_commerce/utils/widgets/Circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utils/widgets/CustomClipper.dart';
import '../../../../utils/widgets/product_items.dart';
import '../../../models/product.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    final categories = [
      {"icon": Icons.sports_soccer, "label": "Sports"},
      {"icon": Icons.chair, "label": "Furniture"},
      {"icon": Icons.memory, "label": "Electronics"},
      {"icon": Icons.shopping_bag, "label": "Clothes"},
      {"icon": Icons.directions_run, "label": "Shoes"},
    ];

    final products = List.generate(
      10,
      (index) => Product(
        name: 'iPhone 11 64GB',
        brand: 'Apple',
        discountPercent: 49,
        imagePath: 'assets/products/product_4_1.png',
        oldPrice: 299,
        price: 199,
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  clipper: BottomWaveClipper(),
                  child: Container(
                    height: 350.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 24.h,
                    ),
                    color: const Color(0xFF1E56A0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Good Morning',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                          const Text(
                            'Unknown Pro',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          const Text(
                            'Popular Categories',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          SizedBox(
                            height: 100.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              itemCount: categories.length,
                              separatorBuilder:
                                  (context, index) => SizedBox(width: 16.w),
                              itemBuilder: (context, index) {
                                final item = categories[index];
                                return categoryItem(
                                  item["icon"] as IconData,
                                  item["label"] as String,
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
                // Circle Decorations
                Positioned(
                  top: -120,
                  right: -132,
                  child: Circle(
                    width: 298.w,
                    height: 264.h,
                    color: UColors.circle20,
                  ),
                ),
                Positioned(
                  top: 70,
                  right: -200,
                  child: Circle(
                    width: 298.w,
                    height: 264.h,
                    color: UColors.circle20,
                  ),
                ),
                // Search Field
                Positioned(
                  bottom: 20,
                  left: 24,
                  right: 24,
                  child: Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search in Store',
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // BANNER SLIDER
            SizedBox(height: 4.h),
            Obx(() {
              return Column(
                children: [
                  SizedBox(
                    height: 180,
                    // Removed .h assuming it’s from a custom extension
                    child: PageView.builder(
                      controller: controller.pageController,
                      itemCount: null, // Infinite scroll
                      onPageChanged: controller.onPageChanged,
                      itemBuilder: (context, index) {
                        final bannerIndex = index % controller.banners.length;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              controller.banners[bannerIndex],
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(controller.banners.length, (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: controller.currentPage.value == index ? 12 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color:
                              controller.currentPage.value == index
                                  ? Colors.blueAccent
                                  : Colors.grey[300],
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),
                ],
              );
            }),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.h,
                    vertical: 8.w,
                  ),
                  child: Text(
                    "Popular Categories",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: UColors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.h,
                    vertical: 8.w,
                  ),
                  child: Text(
                    "View all",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: UColors.buttonPrimary,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
            // SizedBox(height: 8.h),
            GridView.builder(
              itemCount: products.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                return ProductItem(products[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
