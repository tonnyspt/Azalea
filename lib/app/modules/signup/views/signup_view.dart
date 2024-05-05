import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_10/app/routes/app_pages.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/bg_login.png"), fit: BoxFit.cover),
      ),
      child: ListView(children: [
        Form(
          key: controller.form,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                child: const Text(
                  "Register Your Account",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  width: 300,
                  // height: 400,
                  // color: Colors.grey[300],
                  child: Column(children: [
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: const Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    TextFormField(
                      controller: controller.emailController,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 212, 212, 212)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding:
                              const EdgeInsets.only(top: 5, left: 15),
                          hintText: "Email here...",
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 13)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Masukan Email!';
                        } else if (!value.isEmail) {
                          return 'Masukan Email Yang Benar!';
                        }
                        return null;
                      },
                    ),
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: const Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    TextFormField(
                      controller: controller.usernameController,
                      obscureText: false,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 212, 212, 212)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding:
                              const EdgeInsets.only(top: 5, left: 15),
                          hintText: "Username here...",
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 13)),
                    ),
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: const Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    TextFormField(
                      controller: controller.nameController,
                      obscureText: false,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 212, 212, 212)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding:
                              const EdgeInsets.only(top: 5, left: 15),
                          hintText: "Name here...",
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 13)),
                    ),
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: const Text(
                        "Address",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    TextFormField(
                      controller: controller.addressController,
                      obscureText: false,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 212, 212, 212)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding:
                              const EdgeInsets.only(top: 5, left: 15),
                          hintText: "Address here...",
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 13)),
                    ),
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: const Text(
                        "Phone Number",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    TextField(
                      controller: controller.phoneNumberController,
                      obscureText: false,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 212, 212, 212)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding:
                              const EdgeInsets.only(top: 5, left: 15),
                          hintText: "Phone Number here...",
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 13)),
                    ),
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: const Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    TextFormField(
                      controller: controller.passwordController,
                      obscureText: true,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 212, 212, 212)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding:
                              const EdgeInsets.only(top: 5, left: 15),
                          hintText: "Password here...",
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 13)),
                    ),
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: const Text(
                        "Confirm Password",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    TextFormField(
                      controller: controller.confirmPasswordController,
                      obscureText: true,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 212, 212, 212)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding:
                              const EdgeInsets.only(top: 5, left: 15),
                          hintText: "Confirm Your Password here...",
                          hintStyle: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 13)),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                        width: 300,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 213, 103, 205)),
                            onPressed: () async {
                              await controller.signup(
                                  controller.usernameController.text,
                                  controller.nameController.text,
                                  controller.emailController.text,
                                  controller.addressController.text,
                                  controller.phoneNumberController.text,
                                  controller.passwordController.text);
                            },
                            child: const Text(
                              "Register",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ))),
                    Row(
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.offAllNamed(Routes.LOGIN);
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 0, 148, 255)),
                            ))
                      ],
                    ),
                  ]))
            ],
          ),
        ),
      ]),
    ));
  }
}
