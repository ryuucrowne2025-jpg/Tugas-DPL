import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/home_controller.dart';
import 'controllers/login_controller.dart';
import 'models/alumni_model.dart';
import 'views/login_view.dart';
import 'views/home_view.dart';

class AlumniRepositoryImpl implements AlumniRepository {
  List<Alumni> _alumniList = [];

  @override
  Future<List<Alumni>> fetchAllAlumni() async {
    await Future.delayed(Duration(milliseconds: 100));
    return _alumniList.toList();
  }

  @override
  Future<void> addAlumni(Alumni alumni) async {
    await Future.delayed(Duration(milliseconds: 100));
    _alumniList.add(alumni);
  }

  @override
  Future<void> deleteAlumni(String nobp) async {
    await Future.delayed(Duration(milliseconds: 100));
    _alumniList.removeWhere((a) => a.nobp == nobp);
  }

  void setInitialData(List<Alumni> data) {
    _alumniList.assignAll(data);
  }
}

void main() {
  Get.put<AlumniRepository>(AlumniRepositoryImpl());
  Get.lazyPut(() => HomeController(repository: Get.find<AlumniRepository>()));
  Get.lazyPut(() => LoginController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tugas DPL',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginView()),
        GetPage(name: '/home', page: () => HomeView()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
