import 'package:flutter/material.dart';
Widget custombuildVerticalScroll(
    List<dynamic> items, Widget Function(int) itemBuilder) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(items.length, (index) {
        return itemBuilder(index);
      }),
    ),
  );
}