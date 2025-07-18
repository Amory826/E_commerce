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
    final bottomPadding = (ratio! <= 2.0) ? 0.0 : 15.0;

    final items = [
      {'icon': Icons.bookmark, 'label': 'Tổng quan'},
      {'icon': Icons.grid_view, 'label': 'Sơ đồ phòng'},
      // {'icon': Icons.add_circle_outline, 'label': ''}, // middle
      {'icon': Icons.calendar_today_outlined, 'label': 'Lịch phòng'},
      {'icon': Icons.menu, 'label': 'Thông tin'},
    ];

    return Obx(
      () => Container(
        padding: EdgeInsets.only(bottom: bottomPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        height: 70.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (index) {
            final item = items[index];
            final isSelected = index == controller.currentIndexBar.value;

            // Middle icon (add)
            if (index == 10) {
              return GestureDetector(
                onTap: () => controller.navigateToPage(index),
                child: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade200,
                  ),
                  child: Icon(
                    item['icon'] as IconData,
                    size: 28.sp,
                    color: Colors.black,
                  ),
                ),
              );
            }

            return GestureDetector(
              onTap: () => controller.navigateToPage(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item['icon'] as IconData,
                    size: 24.sp,
                    color: isSelected ? UColors.primary : Colors.grey,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    item['label'] as String,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: isSelected ? UColors.primary : Colors.grey,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
