import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../extension/constant.dart';

class BaseControllerController extends GetxController {
  var bottomController = PageController().obs;
  var currentIndexBar = 0.obs;
  var namePageAppBar = ''.obs;

  var page = 0.obs;

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
    if (bottomController.value.hasClients) {
      bottomController.value.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }
}
