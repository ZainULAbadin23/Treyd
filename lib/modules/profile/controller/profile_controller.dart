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

  bool isDarkMode = false;

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    update(); // Notify listeners
  }

  bool isEmailEnabled = false;
  bool isSMSEnabled = false;

  void toggleEmailNotifications() {
    isEmailEnabled = !isEmailEnabled;
    update(); // Notify listeners
  }

  void toggleSMSNotifications() {
    isSMSEnabled = !isSMSEnabled;
    update(); // Notify listeners
  }

  bool is2FAEnabled = false;
  void toggle2FA() {
    is2FAEnabled = !is2FAEnabled;
    update(); // Notify listeners
  }

}