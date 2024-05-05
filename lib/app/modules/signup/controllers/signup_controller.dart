import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class SignupController extends GetxController {
  final form = GlobalKey<FormState>();
  CollectionReference ref = FirebaseFirestore.instance.collection('User');
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<bool> checkUsernameExists(String username) async {
    final check = await ref.where('username', isEqualTo: username).get();
    return check.docs.isNotEmpty;
  }

  
  Future<bool> checkEmailExists(String email) async {
    final check = await ref.where('email', isEqualTo: email).get();
    return check.docs.isNotEmpty;
  }

  Future<void> signup(
    String username,
    String name,
    String email,
    String address,
    String phoneNumber,
    String password,
  ) async {
    if (form.currentState!.validate() &&
        emailController.text.isEmail &&
        passwordController.text == confirmPasswordController.text &&
        passwordController.text.isNotEmpty) {
      try {
        //Check username terdaftar
        final usernameExists = await checkUsernameExists(username);
        if (usernameExists) {
          Get.snackbar(
            'Error',
            'Username Sudah Terdaftar!',
            backgroundColor: Colors.red,
            colorText: Colors.yellow,
          );
          return;
        }
        //Check Email terdaftar 
        final emailExists = await checkEmailExists(email);
        if (emailExists) {
          Get.snackbar(
            'Error',
            'Email Sudah Terdaftar!',
            backgroundColor: Colors.red,
            colorText: Colors.yellow,
          );
          return;
        }
        final refDoc = ref.doc(username);
        final user = {
          "username": usernameController.text,
          "name": nameController.text,
          "email": emailController.text,
          "address": addressController.text,
          "phoneNumber": phoneNumberController.text,
          "password": passwordController.text,
        };
        refDoc.set(user);
        Get.snackbar('Pendaftaran Berhasil!', "Silahkan Login");
        Get.offNamed(Routes.LOGIN);
      } catch (error) {
        if (error is PlatformException) {
          if (error.code == 'email-already-in-use') {
            Get.snackbar('Error', 'Email Sudah Terdaftar!');
          } else {
            Get.snackbar('Error', 'Pendaftaran Gagal: ${error.message}');
          }
        } else {
          Get.snackbar('Error', 'Pendaftaran Gagal: $error');
        }
      }
    } else if (emailController.text.isEmpty ||
        usernameController.text.isEmpty ||
        nameController.text.isEmpty ||
        addressController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Get.snackbar('Tidak Berhasil', 'Masukan Semua Data!' ,backgroundColor: Colors.red,
            colorText: Colors.yellow,);
    } else if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar('Tidak Berhasil', 'Password Tidak Sama!', backgroundColor: Colors.red,
            colorText: Colors.yellow,);
    } else if (emailController.text != emailController.text.isEmail) {
      Get.snackbar("Bukan Email", "Masukan Format Email Yang Benar!", backgroundColor: Colors.red,
            colorText: Colors.yellow,);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    usernameController.dispose();
    nameController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
