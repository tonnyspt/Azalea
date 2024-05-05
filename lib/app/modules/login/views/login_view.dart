import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_10/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
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
                padding: EdgeInsets.only(top: 40),
                child: Image.asset("images/login_logo.png"),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  width: 300,
                  // height: 400,
                  // color: Colors.grey[300],
                  child: Column(children: [
                    Center(
                      child: Text(
                        "Welcome To Azalea",
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.topStart,
                      padding: EdgeInsets.only(top: 10, bottom: 5),
                      child: Text(
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
                          contentPadding: EdgeInsets.only(top: 5, left: 15),
                          hintText: "Password here...",
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
                            onPressed: () {
                              if (controller.form.currentState!.validate()) {
                                controller.login(
                                  controller.usernameController.text,
                                  controller.passwordController.text,
                                );
                              }
                            },
                            child: const Text(
                              "Login",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ))),
                    Row(
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.offAllNamed(Routes.SIGNUP);
                            },
                            child: const Text(
                              "Sign up",
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
