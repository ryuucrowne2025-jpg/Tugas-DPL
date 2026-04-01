import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'detail_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final controller = Get.put(HomeController()); //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Alumni")),
      body: Obx(() => ListView.builder(
            itemCount: controller.alumniList.length,
            itemBuilder: (context, index) {
              var alumni = controller.alumniList[index];
              return ListTile(
                title: Text(alumni.nama),
                subtitle: Text("${alumni.prodi} - ${alumni.tahun}"),
                onTap: () => Get.to(() => DetailView(alumni: alumni)),
              );
            },
          )),
    );
  }
}
