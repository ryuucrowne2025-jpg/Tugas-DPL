import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tracking_controller.dart';

class TrackingView extends StatelessWidget {
  final String nama;
  final controller = Get.find<TrackingController>();

  TrackingView({required this.nama});

  @override
  Widget build(BuildContext context) {
    controller.trackAlumni(nama);

    return Scaffold(
      appBar: AppBar(title: Text("Hasil Pelacakan")),
      body: Center(
        child: Obx(() {
          if (controller.isLoading.value) {
            return CircularProgressIndicator();
          }

          var data = controller.result.value;
          if (data == null) return Text("Tidak ada data");

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Jabatan: ${data.jabatan}"),
              Text("Instansi: ${data.instansi}"),
              Text("Lokasi: ${data.lokasi}"),
              Text("Score: ${data.score}"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Get.back(),
                child: Text("Selesai"),
              )
            ],
          );
        }),
      ),
    );
  }
}
