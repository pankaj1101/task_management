import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:task_management/views/login_screen.dart';

class SignupController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var emailError = ''.obs;
  var passwordError = ''.obs;
  var confirmPasswordError = ''.obs;

  FirebaseAuth _auth = FirebaseAuth.instance;

  void validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      emailError.value = 'Enter a valid email';
    } else {
      emailError.value = '';
    }
  }

  void validatePassword(String value) {
    if (value.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
    } else {
      passwordError.value = '';
    }
  }

  void validateConfirmPassword(String value) {
    if (value != password.value) {
      confirmPasswordError.value = 'Passwords do not match';
    } else {
      confirmPasswordError.value = '';
    }
  }

  Future<void> signup() async {
    validateEmail(email.value);
    validatePassword(password.value);
    validateConfirmPassword(confirmPassword.value);

    if (emailError.isEmpty &&
        passwordError.isEmpty &&
        confirmPasswordError.isEmpty) {
      try {
        await _auth.createUserWithEmailAndPassword(
          email: email.value,
          password: password.value,
        );
        Get.snackbar('Success', 'Signup successful');
        email.value = '';
        password.value = '';
        confirmPassword.value = '';

        // Navigate to LoginScren after signup
        Get.to(LoginScreen());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          Get.snackbar('Error',
              'The email address is already in use by another account.');
        } else {
          Get.snackbar('Error', e.message!);
        }
      } catch (e) {
        Get.snackbar('Error', e.toString());
      }
    }
  }
}
