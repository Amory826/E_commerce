import 'package:e_commerce/app/modules/profile/controllers/profile_controller.dart';
import 'package:e_commerce/app/modules/store/controllers/store_controller.dart';
import 'package:e_commerce/app/modules/wishlist/controllers/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../extension/constant.dart';
import '../../home/bindings/home_binding.dart';
import '../../home/controllers/home_controller.dart';

class BaseControllerController extends GetxController {
  var bottomController = PageController();
  var currentIndexBar = 0.obs;
  var namePageAppBar = ''.obs;

  var page = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    lazyInitControllers();
    super.onInit();
  }

  navigateToPage(int input) {
    debugPrint("input: $input ${pages[input]}");
    currentIndexBar.value = input;
    namePageAppBar.value = pages[input];
    animateTo(input);
    onPageChanged(input);
  }

  onPageChanged(input) {
    page.value = input;
  }

  animateTo(int page) {
    if (bottomController.hasClients) {
      bottomController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void lazyInitControllers() {
    //Init Controllers
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<StoreController>(() => StoreController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<WishlistController>(() => WishlistController());
  }
}
