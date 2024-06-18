import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/controllers/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController());

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => TextField(
              onChanged: (value) {
                signupController.email.value = value;
              },
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: signupController.emailError.value.isEmpty
                    ? null
                    : signupController.emailError.value,
              ),
            )),
            Obx(() => TextField(
              onChanged: (value) {
                signupController.password.value = value;
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: signupController.passwordError.value.isEmpty
                    ? null
                    : signupController.passwordError.value,
              ),
            )),
            Obx(() => TextField(
              onChanged: (value) {
                signupController.confirmPassword.value = value;
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                errorText: signupController.confirmPasswordError.value.isEmpty
                    ? null
                    : signupController.confirmPasswordError.value,
              ),
            )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: signupController.signup,
              child: const Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
