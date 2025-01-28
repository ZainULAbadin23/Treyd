import 'package:get/get.dart';

import '';

class SwapController extends GetxController{
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
  var details = <Map<String, String>>[
    {"label": "From", "value": "Tether"},
    {"label": "To", "value": "Bitcoin"},
    {"label": "1 BTC", "value": "0.00000045 BTC"},
    {"label": "You will receive", "value": "0.000034 BTC"},
  ].obs;
  var pin = ''.obs;

  // Method to update the PIN
  void updatePin(String value) {
    if (value.length <= 4) {
      pin.value = value;
    }
  }
}