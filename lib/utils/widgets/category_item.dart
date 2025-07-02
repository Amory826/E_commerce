import 'package:e_commerce/utils/UColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandCards extends StatelessWidget {
  final String name;
  final String productCount;
  final List<String> imageUrls;

  const BrandCards({
    super.key,
    required this.name,
    required this.productCount,
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: UColors.white,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo + Tên + Tick
            Row(
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Icon(Icons.verified, color: Colors.blue, size: 18),
              ],
            ),
            SizedBox(height: 4),
            Text(
              '$productCount products',
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 12),
            // Hình ảnh sản phẩm
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  imageUrls
                      .map(
                        (url) => Container(
                          width: 100.w,
                          height: 100.h,
                          decoration: BoxDecoration(
                            color: UColors.lightGrey,
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(url), // SỬA Ở ĐÂY
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
