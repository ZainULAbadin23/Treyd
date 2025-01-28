import 'package:get/get.dart';

class AccountController extends GetxController{
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

  var isSwitched = false.obs; // Observable variable

  void toggleSwitch(bool value) {
    isSwitched.value = value;
  }

}