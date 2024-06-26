import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'View/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MVVM TODO LIST WITH GETX',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
