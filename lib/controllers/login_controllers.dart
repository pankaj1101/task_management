import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:task_management/views/home_screen.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var emailError = ''.obs;
  var passwordError = ''.obs;
  RxString userId = ''.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  Future<void> login() async {
    validateEmail(email.value);
    validatePassword(password.value);

    if (emailError.isEmpty && passwordError.isEmpty) {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email.value,
          password: password.value,
        );
        User? user = userCredential.user;

        if (user != null) {
          userId.value = user.uid;
          Get.snackbar('Success', 'Login successful');
          Get.off(() => HomeScreen());
        } else {
          Get.snackbar('Error', 'User not found');
        }
      } catch (e) {
        Get.snackbar('Error', e.toString());
      }
    }
  }
}
