import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/utilities.dart';
import '../../../models/product.dart';

class ProductDetailController extends GetxController {
  final product = Product().obs;

  @override
  void onInit() {
    super.onInit();

    try {
      final args = Get.arguments;
      if (args != null && args['product'] != null) {
        product.value = args['product'] as Product;
        debugPrint("✅ Đã nhận product: ${product.value.name}");
      } else {
        debugPrint("❌ Không có args hoặc args['product'] null");
        showToast('Không có dữ liệu sản phẩm');
        Get.back();
      }
    } catch (error, stackTrace) {
      showToast('Vui lòng thử lại');
      debugPrint('❌ Error: $error');
      debugPrint('StackTrace: $stackTrace');
      Get.back();
    }
  }
}
