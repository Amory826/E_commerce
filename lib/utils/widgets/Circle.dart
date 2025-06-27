import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const Circle({
    super.key,
    this.width = 100, // Giá trị mặc định
    this.height = 100, // Giá trị mặc định
    this.color = Colors.blue, // Giá trị mặc định
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
