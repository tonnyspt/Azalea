import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_10/app/routes/app_pages.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Get.offNamed(Routes.LOGIN);
    });
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg_splash.png'), fit: BoxFit.cover
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/bunga_ungu.png"),
            Text("HELLO FELLAS.", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            Container(
              width: 210,
              // color: Colors.grey[300],
              child: Text("Temukan segala jenis bunga dari berbagai belahan dunia!",textAlign: TextAlign.justify, style: 
              TextStyle(fontSize: 12,),))
          ],
        ),
      ),
    ));
  }
}
