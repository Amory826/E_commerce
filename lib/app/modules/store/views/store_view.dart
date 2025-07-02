import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utils/UColors.dart';
import '../../../../utils/widgets/Circle.dart';
import '../../../../utils/widgets/CustomClipper.dart';
import '../../../../utils/widgets/category_item.dart';
import '../../../../utils/widgets/product_items.dart';
import '../../../models/brand.dart';
import '../../../models/product.dart';
import '../controllers/store_controller.dart';
import '../../../../utils/widgets/brand_items.dart';

class StoreView extends GetView<StoreController> {
  final brands = List.generate(
    10,
    (index) => Brand(
      urlBrand: 'assets/brands/adidas.jpg',
      nameBrand: 'Adidas',
      quantity: 49,
    ),
  );

  final products = List.generate(
    4,
    (index) => Product(
      name: 'iPhone 11 64GB',
      brand: 'Apple',
      discountPercent: 49,
      imagePath: 'assets/products/product_4_1.png',
      oldPrice: 299,
      price: 199,
    ),
  );

  StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.white,
      body: NestedScrollView(
        controller: ScrollController(),
        headerSliverBuilder:
            (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: Stack(
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
                      ),
                    ),
                    Positioned(
                      top: -100,
                      right: -132,
                      child: Circle(
                        width: 298.w,
                        height: 264.h,
                        color: UColors.circle20,
                      ),
                    ),
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 28,
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Store',
                              style: TextStyle(
                                fontFamily: "Nunito",
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.storefront,
                                color: Colors.white,
                                size: 30.sp,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
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
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.h,
                          vertical: 8.w,
                        ),
                        child: Text(
                          "Brands",
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w800,
                            color: UColors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.h,
                          vertical: 8.w,
                        ),
                        child: Text(
                          "View all",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: UColors.buttonPrimary,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 80.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    itemCount: brands.length,
                    itemBuilder: (context, index) => BrandItems(brands[index]),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverPersistentHeader(
                pinned: true,
                delegate: _TabBarDelegate(
                  TabBar(
                    isScrollable: true,
                    controller: controller.tabController,
                    onTap: controller.changeTab,
                    labelPadding: EdgeInsets.only(left: 1, right: 16),
                    tabs:
                        controller.categories.map((e) => Tab(text: e)).toList(),
                  ),
                ),
              ),
            ],
        body: TabBarView(
          controller: controller.tabController,
          children:
              controller.categories.map((category) {
                return CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.all(16),
                      sliver: Obx(
                        () => SliverList(
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            final brand = controller.brands[index];
                            return BrandCards(
                              name: brand['name'].toString(),
                              productCount: brand['products'].toString(),
                              imageUrls:
                                  (brand['images'] as List).cast<String>(),
                            );
                          }, childCount: controller.brands.length),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.h,
                                vertical: 8.w,
                              ),
                              child: Text(
                                "You might like",
                                style: TextStyle(
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold,
                                  color: UColors.black,
                                ),
                              ),
                            ),
                            Padding(
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: GridView.builder(
                        itemCount: products.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.all(16),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.65,
                              // mainAxisSpacing: 16,
                              // crossAxisSpacing: 16,
                            ),
                        itemBuilder: (context, index) {
                          return ProductItem(products[index]);
                        },
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate(this.tabBar);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant _TabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
