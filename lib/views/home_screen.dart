import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreen'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              authController.logout();
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}
