import 'package:get/get.dart';

class DepositCryptoController extends GetxController{
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
}