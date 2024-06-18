import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:task_management/views/login_screen.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.off(LoginScreen());
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
