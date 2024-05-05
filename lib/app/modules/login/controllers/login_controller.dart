import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final form = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // @override
  // void onClose() {
  //   usernameController.dispose();
  //   passwordController.dispose();
  //   super.onClose();
  // }

  Future<void> login(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Masukan  Username dan Password!',
          backgroundColor: Colors.red, colorText: Colors.yellow);
      return;
    }
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('User')
          .where('username', isEqualTo: username)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final user = querySnapshot.docs.first.data();
        if (user['password'] == password) {
          Get.offNamed(Routes.HOME, arguments: {'username': username});
        } else {
          Get.snackbar('Error', 'Password Salah!',
          backgroundColor: Colors.red, colorText: Colors.yellow);
        }
      } else {
        Get.snackbar('Error', 'Pengguna Tidak Ditemukan!',
        backgroundColor: Colors.red, colorText: Colors.yellow);
      }
    } catch (error) {
      Get.snackbar('Error', 'Login Gagal!: $error',
      backgroundColor: Colors.red, colorText: Colors.yellow);
    }
  }
}
