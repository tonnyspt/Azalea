import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // name: "main",
    options: const FirebaseOptions(
      apiKey: "AIzaSyBFv4f7yhOYUq0f4BtH6f95lFSdeQg1J3k",
      appId: "1:488407155466:android:2531058ee2ff817c8270f3",
      messagingSenderId: "488407155466",
      projectId: "azalea-b6b5c",
      storageBucket: "gs://azalea-b6b5c.appspot.com", 
    ),
  );
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      theme: ThemeData(fontFamily: "Poppins"),
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
