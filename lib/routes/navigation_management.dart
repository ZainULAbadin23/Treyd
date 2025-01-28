import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navigation {
  static back({BuildContext? context}){
    FocusScopeNode currentFocus = FocusScope.of(context ?? Get.key.currentContext!);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild!.unfocus();
      Get.back();
      // Future.delayed(const Duration(milliseconds: 500),(){
      //   Get.back();
      // });
    } else {
      FocusManager.instance.primaryFocus?.unfocus();
      Get.back();
    }
  }
  static to(dynamic page, {dynamic arguments}){
    Get.to(page,arguments: arguments);
  }
  static toNamed(String page, {dynamic arguments,Map<String,String>? parameters}){
    Get.toNamed(page,arguments: arguments,parameters: parameters);
  }
  static offNamed(String page, {dynamic arguments}){
    Get.offNamed(page,arguments: arguments);
  }
  static offAllNamed(String page, {dynamic arguments}){
    Get.offAllNamed(page,arguments: arguments);
  }
}