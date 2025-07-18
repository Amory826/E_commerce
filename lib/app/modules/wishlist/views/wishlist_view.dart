import 'package:e_commerce/app/modules/wishlist/controllers/wishlist_controller.dart';
import 'package:e_commerce/utils/UColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/widgets/product_items.dart';
import '../../../models/product.dart';

class WishlistView extends GetView<WishlistController> {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: UColors.white,
      appBar: AppBar(
        backgroundColor: UColors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            "Wishlist",
            style: TextStyle(
              fontFamily: "Nunito",
              color: Colors.black,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add, size: 26.sp, color: Colors.black),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: products.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          return ProductItem(products[index]);
        },
      ),
    );
  }
}
