import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late final PageController pageController;
  var currentPage = 0.obs;

  final banners = [
    'assets/banners/banner_1.jpg',
    'assets/banners/banner_2.jpg',
    'assets/banners/banner_3.jpg',
  ];

  @override
  void onInit() {
    pageController = PageController(
      initialPage: banners.length * 1000,
    ); // Start in the middle for infinite scroll
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onPageChanged(int index) {
    currentPage.value = index % banners.length; // Map index to banner list
  }
}
