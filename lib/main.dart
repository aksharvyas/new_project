import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/modules/splash/splash_screen.dart';

import 'controllers/auth_controller.dart';

void main() {
  Get.put(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
