import 'package:get/get.dart';
import 'package:treyd_crypto/core/utils/app_colors.dart';

import '../../../core/assets/constants.dart';

class TransferFiatController extends GetxController{
  var details = <Map<String, String>>[
    {"label": "Coin", "value": "Tether"},
    {"label": "Network", "value": "TRON"},
  ].obs;
// Observables
  var countryCode = "+234".obs; // Default country code
  var phoneNumber = "".obs; // User-entered phone number
  var password = "".obs; // User-entered password
  var isPasswordVisible = false.obs; // Password visibility toggle

  // Methods
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void updateCountryCode(String code) {
    countryCode.value = code;
  }


  List AccountCards = [
    {
      "name": "GTBank",
      "icon": kPngGTBank,
      "changeValue": '******7362',
      "custName": 'Johnson Doe',
      "color":AppColors.redColorDark,
    },
    {
      "name": "Access Bank",
      "icon": kPngAccessBank,
      "changeValue": '******7362',
      "custName": 'Johnson Doe',
      "color":AppColors.whiteColor1,
    },
  ].obs;
}