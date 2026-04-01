import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/home_binding.dart';
import 'views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pelacakan Alumni',
      initialBinding: HomeBinding(), // 🔥 INI YANG FIX
      home: HomeView(),
    );
  }
}
