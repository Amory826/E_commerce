import 'package:e_commerce/utils/UColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget categoryItem(IconData icon, String label) {
  return Column(
    children: [
      CircleAvatar(
        radius: 32.h,
        backgroundColor: Colors.white,
        child: Icon(icon, color: UColors.primary),
      ),
      const SizedBox(height: 8),
      Text(label, style: const TextStyle(color: Colors.white)),
    ],
  );
}
