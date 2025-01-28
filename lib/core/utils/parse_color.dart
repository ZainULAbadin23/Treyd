import 'package:flutter/material.dart';

Color parseColor(String hexCode, {double? opacity}) {
  try {
    return Color(int.parse(hexCode.replaceAll("#", "0xFF"))).withOpacity(opacity ?? 1);
  } catch (e) {
    return const Color(0xFFCCCCCC).withOpacity(opacity ?? 1);
  }
}