import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/controllers/login_controllers.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                loginController.email.value = value;
              },
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: loginController.emailError.value.isEmpty
                    ? null
                    : loginController.emailError.value,
              ),
            ),
            TextField(
              onChanged: (value) {
                loginController.password.value = value;
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: loginController.passwordError.value.isEmpty
                    ? null
                    : loginController.passwordError.value,
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Signup',
                style: TextStyle(color: Colors.lightBlue),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: loginController.login,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
