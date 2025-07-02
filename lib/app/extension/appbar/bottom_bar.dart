import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce/utils/UColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../modules/base_controller/controllers/base_controller_controller.dart';

class CustomeBottomBar extends StatelessWidget {
  final BaseControllerController controller;

  const CustomeBottomBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final ratio = ScreenUtil().pixelRatio;

    return Obx(
      () => Container(
        padding: REdgeInsets.only(bottom: (ratio! <= 2.0) ? 0 : 15.0),
        child: CurvedNavigationBar(
          height: 50,
          index: controller.currentIndexBar.value,
          animationDuration: const Duration(milliseconds: 0),
          backgroundColor: UColors.primary,
          items: const <Widget>[
            Icon(Icons.home, size: 24),
            Icon(Icons.storefront_outlined, size: 24),
            Icon(Icons.favorite_border, size: 24),
            Icon(Icons.account_circle_outlined, size: 24),
          ],
          onTap: (index) {
            controller.navigateToPage(index);
          },
        ),
      ),
    );
  }
}
