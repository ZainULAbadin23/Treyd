import 'package:get/get.dart';

class RegisterController extends GetxController {
  // Observables
  var isPasswordValid = false.obs;
  var isBiometricsEnabled = false.obs;

  // Password validation logic
  void validatePassword(String password) {
    const minLength = 8;
    final hasUpperCase = password.contains(RegExp(r'[A-Z]'));
    final hasLowerCase = password.contains(RegExp(r'[a-z]'));
    final hasDigit = password.contains(RegExp(r'[0-9]'));
    final hasSpecialCharacter = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    isPasswordValid.value =
        password.length >= minLength && hasUpperCase && hasLowerCase && hasDigit && hasSpecialCharacter;
  }

  // Toggle password visibility

  // Toggle biometrics
  void toggleBiometrics() {
    isBiometricsEnabled.value = !isBiometricsEnabled.value;
  }
}
