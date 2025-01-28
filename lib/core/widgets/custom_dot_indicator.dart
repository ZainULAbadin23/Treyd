import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class Dot extends StatelessWidget {
  final bool isActive;
  final double height;
  final double width;

  const Dot({
    Key? key,
    required this.isActive,
    this.height = 6,
    this.width =12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isActive ? AppColors.primaryColor : AppColors.greyColor200),
    );
  }
}
