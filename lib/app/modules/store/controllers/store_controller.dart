import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreController extends GetxController with GetTickerProviderStateMixin {
  var selectedTabIndex = 0.obs;
  late TabController tabController;
  final List<String> categories = [
    'Sports',
    'Furniture',
    'Electronics',
    'Clothes',
    'Special',
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: categories.length, vsync: this);
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        selectedTabIndex.value = tabController.index;
      }
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  // Mỗi category chứa danh sách brand
  final brands =
      List.generate(
        3,
        (_) => {
          'name': 'Bata',
          'products': 172,
          'images': [
            'assets/products/product.png',
            'assets/products/product.png',
            'assets/products/product.png',
          ],
        },
      ).obs;

  void changeTab(int index) {
    selectedTabIndex.value = index;
    tabController.animateTo(index);
  }
}
