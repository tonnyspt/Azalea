import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
          body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/bg_home.png"), fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    alignment: Alignment.topLeft,
                    width: 350,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Obx(() => Text(
                                          "Hello, ${controller.name.value}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                  ],
                                ),
                                Obx(() => CircleAvatar(
                                      radius: 25,
                                      backgroundImage:
                                          controller.imageURL.value.isNotEmpty
                                              ? NetworkImage(
                                                  controller.imageURL.value)
                                              : const AssetImage(
                                                      "images/login_logo.png")
                                                  as ImageProvider,
                                    ))
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 0.1),
                                child: Text("How's your day going? ")),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 20,
                    color: Colors.black26,
                  ),
                  SizedBox(
                    width: 350,
                    child: Row(
                      children: [
                        Obx(() => Text(
                              "My Email : ${controller.email.value}",
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 350,
                    child: Row(
                      children: [
                        Obx(() => Text(
                              "My Phone Number : ${controller.phoneNumber.value}",
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 350,
                    child: Row(
                      children: [
                        Obx(() => Text(
                              "My Address : ${controller.address.value}",
                            )),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 150),
                          width: 300,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 213, 103, 205)),
                              onPressed: () async {
                                controller.pickImage();
                              },
                              child: const Text(
                                "Upload Foto",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          width: 300,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.red),
                              onPressed: () async {
                              Get.offAllNamed(Routes.LOGIN);
                              },
                              child: const Text(
                                "Log Out",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              )));
    });
  }
}
