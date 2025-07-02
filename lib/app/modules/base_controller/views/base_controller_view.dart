import 'package:e_commerce/app/modules/profile/views/profile_view.dart';
import 'package:e_commerce/app/modules/store/views/store_view.dart';
import 'package:e_commerce/app/modules/wishlist/views/wishlist_view.dart';
import 'package:e_commerce/utils/UColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../extension/appbar/bottom_bar.dart';
import '../../home/views/home_view.dart';
import '../controllers/base_controller_controller.dart';

class BaseControllerView extends GetView<BaseControllerController> {
  final Widget? child;

  const BaseControllerView({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final pageController = controller.bottomController; // lấy 1 lần

    return GetBuilder<BaseControllerController>(
      builder:
          (_) => Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.white,
                bottomNavigationBar: CustomeBottomBar(controller: controller),
                body: SafeArea(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Expanded(
                          child: PageView(
                            controller: pageController,
                            pageSnapping: false,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              HomeView(),
                              StoreView(),
                              WishlistView(),
                              ProfileView(),
                            ],
                          ),
                        ),
                        Container(color: UColors.primary, height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
