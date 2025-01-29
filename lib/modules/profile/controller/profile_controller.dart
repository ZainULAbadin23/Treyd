import 'package:get/get.dart';

class AccountController extends GetxController{
  var countryCode = "+234".obs;
  var phoneNumber = "".obs;
  var password = "".obs;
  var isPasswordVisible = false.obs;


  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void updateCountryCode(String code) {
    countryCode.value = code;
  }

  bool isDarkMode = false;

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    update();
  }

  bool isEmailEnabled = false;
  bool isSMSEnabled = false;

  void toggleEmailNotifications() {
    isEmailEnabled = !isEmailEnabled;
    update();
  }

  void toggleSMSNotifications() {
    isSMSEnabled = !isSMSEnabled;
    update();
  }

  bool is2FAEnabled = false;
  void toggle2FA() {
    is2FAEnabled = !is2FAEnabled;
    update();
  }
}