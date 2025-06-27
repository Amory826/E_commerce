import 'package:e_commerce/app/modules/profile/views/profile_view.dart';
import 'package:e_commerce/app/modules/store/views/store_view.dart';
import 'package:e_commerce/app/modules/wishlist/views/wishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../extension/appbar/bottom_bar.dart';
import '../../home/views/home_view.dart';
import '../controllers/base_controller_controller.dart';

class BaseControllerView extends GetView<BaseControllerController> {
  final Widget? child;

  const BaseControllerView({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseControllerController>(
      builder:
          (controller) => Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.white,
                bottomNavigationBar: CustomeBottomBar(controller: controller),
                body: Obx(
                  () => SafeArea(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Expanded(
                            child: PageView(
                              controller: controller.bottomController.value,
                              pageSnapping: false,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                HomeView(),
                                StoreView(),
                                WishlistView(),
                                ProfileView(),
                                // RoomsView(),
                                // AddroomView(),
                                // ScheduleView(),
                                // MenuView(),
                              ],
                            ),
                          ),
                          Container(color: Colors.blue, height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // if (controller.isShowAddRoom.isTrue)
              //   AddRoomWidget(
              //     controller: controller,
              //   ),
            ],
          ),
    );
  }
}
