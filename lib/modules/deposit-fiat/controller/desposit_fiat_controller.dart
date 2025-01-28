import 'package:get/get.dart';
import '../../../core/assets/constants.dart';
import '../../../core/utils/app_colors.dart';

class DespositFiatController  extends GetxController{
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